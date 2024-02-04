import { LightningElement, api } from 'lwc';

export default class Paginator extends LightningElement {

    @api
    pageNumber;
    @api
    pageSize;
    @api
    totalItemCount;


    //Event handlers
    handlePrevious() {
        previousPageEvent = new CustomEvent('previous');
        this.dispatchEvent(previousPageEvent);
    }

    handleNext() {
        nextPageEvent = new CustomEvent('next');
        this.dispatchEvent(nextPageEvent);
    }

    //Getters and setters
    get currentPageNumber() {
        return this.totalItemCount === 0 ? 0 : this.pageNumber;
    }

    get isFirstPage() {
        return this.pageNumber === 1;
    }

    get isLastPage() {
        return this.pageNumber >= this.totalPages;
    }

    get totalPages() {
        return Math.ceil(this.totalItemCount / this.pageSize);
    }
}