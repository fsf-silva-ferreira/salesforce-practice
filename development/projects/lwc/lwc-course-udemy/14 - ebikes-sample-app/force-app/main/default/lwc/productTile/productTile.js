import { LightningElement, api } from 'lwc';


export default class ProductTile extends LightningElement {

    //Product fields values to display
    pictureUrl;
    name;
    msrp;

    productForGetterAndSetter;

    //Whether the tile is draggable
    @api
    draggable;    


    //Getters and setters

    //Product__c to display
    @api
    get product() {
        return this.productForGetterAndSetter;
    }

    set product(value) {
        this.productForGetterAndSetter = value;
        this.pictureUrl = value.Picture_URL__c;
        this.name = value.Name;
        this.msrp = value.MSRP__C;
    }


    //Event handlers
    handleClick() {
        const selectedEvent = new CustomEvent(
            'selected', 
            {
                detail: this.product.Id
            }
        )
        this.dispatchEvent(selectedEvent);
    }

    handleDragStart(event) {
        event.dataTransfer.setData('product', JSON.stringify(this.product));
    }
}