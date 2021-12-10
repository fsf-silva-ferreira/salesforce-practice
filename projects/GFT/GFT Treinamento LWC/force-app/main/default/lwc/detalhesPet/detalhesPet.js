/**
    * @description      : 
    * @author           : Flávio da Silva Ferreira
    * @group            : 
    * @created          : 10/12/2021 - 09:15:18
    * 
    * MODIFICATION LOG
    * - Version         : 1.0.0
    * - Date            : 10/12/2021
    * - Author          : fodf
    * - Modification    : Fixes ion onRowAction method.
**/
import { LightningElement, api } from 'lwc';
import getAnimal from '@salesforce/apex/AdocaoPetController.getAnimal';

export default class DetalhesPet extends LightningElement {

    //It cannot be const, to assign values
    columns = [
        /*
        Code is autonumber
        { label: 'Código', fieldName: 'codigoPET', type: 'number'},
        */
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

    data = [];
    tipo;
    apresentacaoPET;
    petLinkVisualizacao;

    onRowAction(event){
        let codigoPET = event.detail.row.codigoPET;
        let nomePET = event.detail.row.nomePET;
        let preferenciaTipoPET = event.detail.row.preferenciaTipoPET;

        console.log('preferenciaTipoPET ' + preferenciaTipoPET);

        getAnimal( { tipoPet : preferenciaTipoPET } )
            .then( (result) => {
                console.log('result=>', result)
                let objResult = JSON.parse(result);

                if(preferenciaTipoPET == 'Gato') {
                    console.log('URL gato ' + objResult[0].url)
                    this.petLinkVisualizacao = objResult[0].url;
                } else {
                    console.log('URL cachorro ' + objResult.message)
                    this.petLinkVisualizacao = objResult.message;
                }            
            });
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