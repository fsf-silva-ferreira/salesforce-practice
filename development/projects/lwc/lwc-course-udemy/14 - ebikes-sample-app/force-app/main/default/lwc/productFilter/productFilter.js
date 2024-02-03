import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { fireEvent } from 'c/pubsubEbikes';

import CATEGORY_FIELD from '@salesforce/schema/Product__c.Category__c';
import LEVEL_FIELD from '@salesforce/schema/Product__c.Level__c';
import MATERIAL_FIELD from '@salesforce/schema/Product__c.Material__c';


const DELAY_FOR_DEBOUNCING_EVENT_HANDLERS = 350;

/**
 * Displays a filter panel to search for Product__c[].
 */
export default class ProductFilter extends LightningElement {

    delayTimeout = DELAY_FOR_DEBOUNCING_EVENT_HANDLERS;

    searchKey = '';
    maxPrice = 10000;

    filters = {
        searchKey: '',
        maxPrice: 10000
    };

    @wire(CurrentPageReference)
    pageRef;


    //Wired properties to read picklist values from Category__c, Level__c and Material__c fields
    //012000000000000AAA for the "Master" RecordTypeId is actually the One Id It Is Okay To Hardcode
    @wire(getPicklistValues, 
        {            
            recordTypeId: '012000000000000AAA',
            fieldApiName: CATEGORY_FIELD
        }
    )
    categories;

    @wire(getPicklistValues, 
        {            
            recordTypeId: '012000000000000AAA',
            fieldApiName: LEVEL_FIELD
        }
    )
    levels;

    @wire(getPicklistValues,
        {            
            recordTypeId: '012000000000000AAA',
            fieldApiName: MATERIAL_FIELD
        }
    )
    materials;


    //Event handlers
    handleSearchKeyChange(event) {
        this.filters.searchKey = event.target.value;
        this.delayedFireFilterChangeEvent();
    }

    handleMaxPriceChange(event) {
        this.filters.maxPrice = event.target.value;
        this.delayedFireFilterChangeEvent;
    }

    handleCheckboxChange(event) {
        if(!this.filters.categories) {
            //Lazy initialize filters with all values initially set
            this.filters.categories = this.categories.data.values.map
            (
                item => item.value
            );
            this.filters.levels = this.levels.data.values.map
            (
                item => item.value
            );
            this.filters.materials = this.materials.data.values.map
            (
                item.value
            );
        }

        const value = event.target.dataset.value;
        const filterArray = this.filters[event.target.dataset.filter];

        if(event.target.checked) {
            if(!filterArray.includes(value)) {
                filterArray.push(value);
            }
        } else {
            console.log('[productFilter] value in handleCheckboxChange method: ' + value);
            
            this.filters[event.target.dataset.filter] = filterArray.filter
            (
                item => item != value
            );
        }

        fireEvent(this.pageRef, 'filterChange', this.filters);
    }


    /*
     * Debouncing this method: Do not actually fire the event as long as this function is
     * being called within a delay of DELAY_FOR_DEBOUNCING_EVENT_HANDLERS.This is to avoid
     * a very large number of Apex method calls in components listening to this event.
    */
    delayedFireFilterChangeEvent() {
        window.clearTimeout(this.delayTimeout);
        //eslint-disable-next-line @lwc/lwc/no-async-operation
        this.delayTimeout = setTimeout(() => {
            fireEvent(this.pageRef, 'filterChange', this.filters);
        }, DELAY_FOR_DEBOUNCING_EVENT_HANDLERS);
    }
}