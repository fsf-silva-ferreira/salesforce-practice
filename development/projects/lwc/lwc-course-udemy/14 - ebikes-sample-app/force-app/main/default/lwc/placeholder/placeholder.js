import { LightningElement, api } from 'lwc';

import BIKE_ASSETS_URL from '@salesforce/resourceUrl/bike_assets'


export default class Placeholder extends LightningElement {

    logoUrl = BIKE_ASSETS_URL + '/logo.svg';

    @api
    message;   
}