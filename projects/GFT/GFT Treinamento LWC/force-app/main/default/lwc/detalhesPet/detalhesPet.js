/**
    * @description      : 
    * @author           : fodf
    * @group            : 
    * @created          : 09/12/2021 - 09:30:11
    * 
    * MODIFICATION LOG
    * - Version         : 1.0.0
    * - Date            : 09/12/2021
    * - Author          : fodf
    * - Modification    : 
**/
import { LightningElement, api } from 'lwc';

export default class DetalhesPet extends LightningElement {

    //Não pode ser uma contante, pois vai receber valores
    columns = [
        { label: 'Código', fieldName: 'codigoPET', type: 'number'},
        { label: 'Nome Pet', fieldName: 'nomePET', type: 'text' },
        { label: 'Tipo', fieldName: 'preferenciaTipoPET', type: 'text' },
        {
            type: 'button',
            typeAttributes : {
                label: 'Ver fotos',
                name: 'View',
                value: 'View'
            }
        }
    ];

    data = []
    tipo;
    apresentacaoPET;
    petURL;

    connectedCallback() {

    }

    onRowAction(event) {
        let codigoPET = event.detail.row.codigoPET;
        let nomePET = event.detail.row.nomePET;
        let preferenciaTipoPET = event.detail.row.preferenciaTipoPET;

        console.log('event=>' + event.detail.row);
    }

    lstMeusPets;

    @api
    updateDataTable(jsonPETs) {
        this.lstMeusPets = jsonPETs;

        if(jsonPETs) {
            this.data = JSON.parse(jsonPETs);
        }
    }
}