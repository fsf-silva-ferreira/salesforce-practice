import { LightningElement } from 'lwc';
import getCurrencyData from '@salesforce/apex/CurrencyConversionController.retrieveCurencyConversionRates';


const options = 
[
    {label: 'USD', value: 'USD'},
    {label: 'EUR', value: 'EUR'},
    {label: 'CAD', value: 'CAD'},
    {label: 'GBP', value: 'GBP'},
    {label: 'INR', value: 'INR'}
];

export default class HttpCalloutBackend extends LightningElement {

    fromCurrencyValue;
    toCurrencyValue;
    options = options;
    toCurrencyOptions = options;
    conversionData;

    handleFromCurrencyChange(event) {
        this.fromCurrencyValue = event.detail.value;
        console.log('this.handleFromCurrencyChange => ' + this.fromCurrencyValue);
    }

    handleToCurrencyChange(event) {
        this.toCurrencyValue = event.detail.value;
        console.log('this.toCurrencyValue => ' + this.toCurrencyValue);
    }

    //TO-DO: Commit this version
    handleCurrencyConversion() {
        let endpoint = 'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency='+this.fromCurrencyValue+'&to_currency='+this.toCurrencyValue
        +'&apikey=PNSMD5PNMH0VMF5P';

        getCurrencyData({strEndpointUrl: endpoint})
        .then(
            data => {
                let objData = {
                    From_Currency_Name: '',
                    From_Currency_Code: '',
                    To_Currency_Name: '',
                    To_Currency_Code: '',
                    Last_Refreshed:'',
                    Exchange_rate:''
                };

                window.console.log('json response => ' + JSON.stringify(data));
                let exchangeData = data['Realtime Currency Exchange Rate'];
                window.console.log('exchange data => ' + exchangeData);

                objData.From_Currency_Code = exchangeData['1. From_Currency Code'];
                objData.From_Currency_Name = exchangeData['2. From_Currency Name'];
                objData.To_Currency_Code = exchangeData['3. To_Currency Code'];
                objData.To_Currency_Name = exchangeData['4. To_Currency Name'];
                objData.Exchange_rate = exchangeData['5. Exchange Rate'];
                objData.Last_Refreshed = exchangeData['6. Last Refreshed'];

                this.conversionData = objData;

                window.console.log('objData => ' + JSON.stringify(objData));
            }            
        )
        .catch(
            error => {
                window.console.log('callout error: ' + JSON.stringify(error));
            }
        )
    }
}