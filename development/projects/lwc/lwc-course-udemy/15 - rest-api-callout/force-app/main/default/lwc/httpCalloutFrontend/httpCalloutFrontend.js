/*
 * Sources:
 * https://medium.com/tech-force/callout-from-lightning-web-component-4e848b72365a
 * https://developer.salesforce.com/docs/platform/lwc/guide/apex-call-imperative.html
*/
import { LightningElement } from 'lwc';
import getExchangeRateMetadata from '@salesforce/apex/CurrencyConversionController.retrieveCurrencyExchangeRateApiMetadata';


const currencies = 
[
    {label: 'USD', value: 'USD'},
    {label: 'EUR', value: 'EUR'},
    {label: 'CAD', value: 'CAD'},
    {label: 'GBP', value: 'GBP'},
    {label: 'INR', value: 'INR'}
];

export default class HttpCalloutFrontend extends LightningElement {

    currencyOptions = currencies;

    //Currency input properties
    fromCurrencyValueInput;
    toCurrencyValueInput;
    fromCurrencyValueOutput;
    toCurrencyValueOutput;

    //Control property
    currenciesTheSame;
    apiRateLimit;

    //API request
    endpoint;
    httpMethod;
    apiKey;

    //API response
    conversionData;


    //Event handlers
    handleFromCurrencyChange(event) {
        this.fromCurrencyValueInput = event.detail.value;
        console.log('this.fromCurrencyValueInput => ' + this.fromCurrencyValueInput);
    }

    handleToCurrencyChange(event) {
        this.toCurrencyValueInput = event.detail.value;
        console.log('this.toCurrencyValueInput => ' + this.toCurrencyValueInput);
    }
    
    handleCurrencyConversion() {
        if(this.fromCurrencyValueInput !== this.toCurrencyValueInput) {
            this.currenciesTheSame = false; 
            this.setConversionData();
        } else {
            this.apiRateLimit = false;
            this.conversionData = null;
            this.currenciesTheSame = true;
        }
    }

    
    //Business logics
    setConversionData() {        
        getExchangeRateMetadata()
        .then(
            currencyExchangeRateApiMetadata => {                
                this.endpoint = currencyExchangeRateApiMetadata['endpoint'];
                this.httpMethod = currencyExchangeRateApiMetadata['httpMethod'];
                this.apiKey = currencyExchangeRateApiMetadata['apiKey'];                
                window.console.log('this.endpoint = ' + this.endpoint);
                window.console.log('this.httpMethod = ' + this.httpMethod);
                window.console.log('this.apiKey = ' + this.apiKey);

                this.setConversionRateFromApi();
            }
        )
        .error(
            error => {
                window.console.log('callout error: ' + JSON.stringify(error));
            }
        )                        
    }

    setConversionRateFromApi() {
        this.endpoint = this.endpoint.replace('{0}', this.fromCurrencyValueInput).replace('{1}', this.toCurrencyValueInput)
            .replace('{2}', this.apiKey);

        fetch(this.endpoint, { method: this.httpMethod})
		.then((response) => {
			return response.json();
		})
		.then((jsonResponse) => {
            this.conversionData = {
                From_Currency_Name: '',
                From_Currency_Code: '',
                To_Currency_Name: '',
                To_Currency_Code: '',
                Last_Refreshed:'',
                Exchange_rate:''
            };
			
			let exchangeData=jsonResponse['Realtime Currency Exchange Rate'];			
            if(exchangeData == undefined) {                    
                if(apiInformation.includes('API rate limit is 25 requests per day')) {                    
                    this.apiRateLimit = true;                        
                }
            } else {
                this.conversionData.From_Currency_Code=exchangeData['1. From_Currency Code'];
                this.conversionData.From_Currency_Name=exchangeData['2. From_Currency Name'];
                this.conversionData.To_Currency_Name=exchangeData['4. To_Currency Name'];
                this.conversionData.To_Currency_Code=exchangeData['3. To_Currency Code'];
                this.conversionData.Last_Refreshed=exchangeData['6. Last Refreshed'];
                this.conversionData.Exchange_rate=exchangeData['5. Exchange Rate'];                
                window.console.log('conversionData => '+JSON.stringify(this.conversionData));

                this.fromCurrencyValueOutput = this.fromCurrencyValueInput;
                this.toCurrencyValueOutput = this.toCurrencyValueInput;  
            }
		}).catch(error=>{
			window.console.log('callout error '+JSON.stringify(error));
		})
    }
}