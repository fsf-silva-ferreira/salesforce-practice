import { LightningElement } from 'lwc';
import getCurrencyData from '@salesforce/apex/CurrencyConversionController.retrieveCurencyConversionRates';


const currencies = 
[
    {label: 'USD', value: 'USD'},
    {label: 'EUR', value: 'EUR'},
    {label: 'CAD', value: 'CAD'},
    {label: 'GBP', value: 'GBP'},
    {label: 'INR', value: 'INR'}
];

export default class HttpCalloutBackend extends LightningElement {

    currencyOptions = currencies;

    //Currency input properties
    fromCurrencyValueInput;
    toCurrencyValueInput;
    fromCurrencyValueOutput;
    toCurrencyValueOutput;

    //Control property
    currenciesTheSame;
    apiRateLimit;

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
            this.getConversionRate();    
        } else {
            this.apiRateLimit = false;
            this.conversionData = null;
            this.currenciesTheSame = true;
        }
    }

    //Business logics
    getConversionRate() {
        getCurrencyData
        (
            {
                fromCurrencyValue: this.fromCurrencyValueInput, 
                toCurrencyValue: this.toCurrencyValueInput
            }
        )
        .then(
            data => {
                let exchangeData = data['Realtime Currency Exchange Rate'];
                const apiInformation = data['Information'];

                if(exchangeData == undefined) {                    
                    if(apiInformation.includes('API rate limit is 25 requests per day')) {                    
                        this.apiRateLimit = true;                        
                    }
                } else {
                    this.conversionData = {
                        From_Currency_Name: '',
                        From_Currency_Code: '',
                        To_Currency_Name: '',
                        To_Currency_Code: '',
                        Last_Refreshed:'',
                        Exchange_rate:''
                    };

                    this.conversionData.From_Currency_Code = exchangeData['1. From_Currency Code'];
                    this.conversionData.From_Currency_Name = exchangeData['2. From_Currency Name'];
                    this.conversionData.To_Currency_Code = exchangeData['3. To_Currency Code'];
                    this.conversionData.To_Currency_Name = exchangeData['4. To_Currency Name'];
                    this.conversionData.Exchange_rate = exchangeData['5. Exchange Rate'];
                    this.conversionData.Last_Refreshed = exchangeData['6. Last Refreshed'];

                    this.fromCurrencyValueOutput = this.fromCurrencyValueInput;
                    this.toCurrencyValueOutput = this.toCurrencyValueInput;           

                    window.console.log('this.conversionData => ' + JSON.stringify(this.conversionData));
                }                
            }            
        )
        .catch(
            error => {
                window.console.log('callout error: ' + JSON.stringify(error));
            }
        )
    }
}