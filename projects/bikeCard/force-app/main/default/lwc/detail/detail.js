/*
    detail.js reúne as partes. Ele cria uma variável privada _productId para rastrear o estado do 
    valor productId. Em seguida, ele usa um padrão get/set para obter o valor e configurá-lo 
    para uma variável privada product que permite que detail.html carregue o conteúdo condicional.
*/
import { LightningElement, api } from 'lwc';
import { bikes } from 'c/data';


export default class Detail extends LightningElement {

    // Ensure changes are reactive when product is updated
    product;

    // Private var to track @api productId
    _productId = undefined;

    // Use set and get to process the value every time it's
    // requested while switching between products
    set productId(value) {
        this._productId = value;
        this.product = bikes.find(bike => bike.fields.Id.value === value);
    }
    
    // getter for productId
    @api get productId(){
        return this._productId;
    }
}