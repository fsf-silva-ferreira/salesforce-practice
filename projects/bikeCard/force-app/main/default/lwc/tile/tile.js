/*
    tile.js tem o método tileClick que cria um novo objeto CustomEvent que contém um valor detail 
    (this.product.fields.Id.value).
*/
import { LightningElement, api } from 'lwc';

export default class Tile extends LightningElement {
    @api product;

    tileClick() {
        const event = new CustomEvent('tileclick', {
            // detail contains only primitives
            detail: this.product.fields.Id.value
        });
        // Fire the event from c-tile
        this.dispatchEvent(event);
    }
}
