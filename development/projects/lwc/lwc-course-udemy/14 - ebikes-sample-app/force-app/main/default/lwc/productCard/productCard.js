import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { NavigationMixin} from 'lightning/navigation';
import { getRecord } from 'lightning/uiRecordApi';
import { registerListener, unregisterAllListeners } from 'c/pubsubEbikes';

import PRODUCT_OBJECT from '@salesforce/schema/Product__c';
import NAME_FIELD from '@salesforce/schema/Product__c.Name';
import LEVEL_FIELD from '@salesforce/schema/Product__c.Level__c';
import CATEGORY_FIELD from '@salesforce/schema/Product__c.Category__c';
import MATERIAL_FIELD from '@salesforce/schema/Product__c.Material__c';
import MSRP_FIELD from '@salesforce/schema/Product__c.MSRP__c';
import PICTURE_URL_FIELD from '@salesforce/schema/Product__c.Picture_URL__C';


//Records fields to load
const fields = 
[
    NAME_FIELD,
    LEVEL_FIELD,
    CATEGORY_FIELD,
    MATERIAL_FIELD,
    MSRP_FIELD,
    PICTURE_URL_FIELD
];

/**
 * Component to display details of a Product__c.
 */
export default class ProductCard extends NavigationMixin(LightningElement) {

    recordId;

    @wire(CurrentPageReference)
    pageRef;

    //Load the Product_-c to display
    @wire(getRecord, {recordId: '$recordId', fields})
    product;


    //Lifecycle hooks
    connectedCallback() {
        registerListener('productSelected', this.handleProductSelected, this)
    }

    disconnectedCallback() {
        unregisterAllListeners(this);
    }


    //Event handlers
    /*
     * Handler for when a product is selected. When `this.recordId` changes, the @wire
     * above will detect the change and provide new data.
    */
    handleProductSelected(productId) {
        this.recordId = productId;
    } 
    
    handleNavigateToRecord() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__recordPage',
                attibutes: 
                {
                    recordId: this.recordId,
                    objectApiName: PRODUCT_OBJECT.objectApiName,
                    actionName: 'view'
                }
            }
        )
    }


    //Getters and setters
    get noData() {
        return !this.product.error && !this.product.data;
    }
}