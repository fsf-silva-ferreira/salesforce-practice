import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import CATEGORY_FIELD from '@salesforce/schema/Product__c.Category__c';
import LEVEL_FIELD from '@salesforce/schema/Product__c.Level__c';
import MATERIAL_FIELD from '@salesforce/schema/Product__c.Material__c';

import { fireEvent } from 'c/pubsub';


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

    /*
     * Wired properties to read picklist values from Category__c, Level__c and Material__c fields.
     *
     * 012000000000000AAA for the "Master" RecordTypeId is actually the One Id It Is Okay To Hardcode.
     * Source: https://developer.salesforce.com/docs/platform/lwc/guide/reference-wire-adapters-picklist-values.html
    */
    @wire(getPicklistValues, 
        {            
            recordTypeId: '012000000000000AAA',
            fieldApiName: CATEGORY_FIELD
        }
    )
    categories;

    @wire(getPicklistValues, {
        recordTypeId: '012000000000000AAA',
        fieldApiName: LEVEL_FIELD
    })
    levels;

    @wire(getPicklistValues, {
        recordTypeId: '012000000000000AAA',
        fieldApiName: MATERIAL_FIELD
    })
    materials;


    //Event handlers
    handleSearchKeyChange(event) {
        this.filters.searchKey = event.target.value;
        this.delayedFireFilterChangeEvent();
    }

    handleMaxPriceChange(event) {
        this.filters.maxPrice = event.target.value;
        //Issue root cause: Missing parentheses - () - in method below
        this.delayedFireFilterChangeEvent();
    }

    handleCheckboxChange(event) {
        if (!this.filters.categories) {
            // Lazy initialize filters with all values initially set
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
                item => item.value
            );
        }

        const value = event.target.dataset.value;
        const filterArray = this.filters[event.target.dataset.filter];

        if (event.target.checked) {
            if (!filterArray.includes(value)) {
                filterArray.push(value);
            }
        } else {
            this.filters[event.target.dataset.filter] = filterArray.filter(
                item => item !== value
            );
        }

        fireEvent(this.pageRef, 'filterChange', this.filters);
    }


    /*
     * Debouncing this method: Do not actually fire the event as long as this function is
     * being called within a delay of DELAY_FOR_DEBOUNCING_EVENT_HANDLERS.This is to avoid
     * a very large number of Apex method calls in components listening to this event.
     * 
     * Sources: 
     * https://www.treinaweb.com.br/blog/o-que-e-debounce-e-qual-sua-importancia-para-a-performance
     * https://www.freecodecamp.org/news/javascript-debounce-example/
    */
    delayedFireFilterChangeEvent() {
        window.clearTimeout(this.delayTimeout);
                
        this.delayTimeout = setTimeout(() => {
            fireEvent(this.pageRef, 'filterChange', this.filters);
        }, DELAY_FOR_DEBOUNCING_EVENT_HANDLERS);
    }
}