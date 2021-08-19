/*
    selector.js tem o método handleProductSelected definido como selectedProductId 
    para o valor evt.detail.

    O serviço de fios é parte de nossa plataforma e oferece um fluxo de dados. 
    O decorador @wire implementa o serviço de fios no aplicativo. 
    Para usar o serviço de fios, faça o seguinte:

    1. Importe um adaptador de fios no arquivo JavaScript.
    2. Decore uma propriedade ou uma função com o decorador @wire.
*/
import { LightningElement, wire } from 'lwc';
//import { adapterId } from 'adapter-module';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';

const fields = [NAME_FIELD];

export default class Selector extends LightningElement {
    selectedProductId;
    handleProductSelected(evt) {
        this.selectedProductId = evt.detail;
    }
    userId = Id;
    //@wire(adapterId, adapterConfig)
    @wire(getRecord, { recordId: '$userId', fields })
    //propertyOrFunction;
    user;
    get name() {
        return getFieldValue(this.user.data, NAME_FIELD);
    }
}
