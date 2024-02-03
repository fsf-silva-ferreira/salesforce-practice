import { LightningElement, api, wire } from 'lwc';
import { CurrentPageReference } from 'lighttning/navigation';
import { registerListener, unregistenersAllListeners, fireEvent} from 'c/pubsubEbikes'
import getProducts from '@salesforce/apex/ProductController.getProducts';


/**
 * Container component that loads and displays a list of Product__c records.
 */
export default class ProductTileList extends LightningElement {

    @wire(CurrentPageReference)
    pageRef;
    @wire(getProducts, {filters: '$filters', pageNumber: '$pageNumber'})
    products;

    //Control properties
    @api
    searchBarIsVisible = false;
    @api
    tilesAreDraggable = false;

    //Paginator properties
    pageNumber = 1;
    pageSize;
    totalItemCount = 0;
    filters = {};


    //Lifecycle hooks
    connectedCallback() {
        registerListener('filterChange', this.handleFilterChange, this);
    }

    disconnectedCallback() {
        unregistenersAllListeners(this);
    }


    //Event handlers
    handleProductsSelected(event) {
        fireEvent(this.pageRef, 'productSelected', event.detail);
    }

    handleSearchKeyChange(event) {
        this.filters = {
            searchKey: event.target.value.toLowerCase()
        };
        this.pageNumber = 1;
    }

    handleFilterChange(filters) {
        console.log('[productTileList] filters parameter in handleFilterChange: ' + filters);

        //Copying filters parameter to filters property (ES6)
        this.filters = {...filters};
        this.pageNumber = 1;
    }

    handlePreviousPage() {
        this.pageNumber = this.pageNumber - 1;
    }

    handleNextPage() {
        this.pageNumber = this.pageNumber + 1;
    }
}