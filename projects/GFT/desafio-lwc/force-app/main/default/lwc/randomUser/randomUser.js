/**
    * @description      : 
    * @author           : fodf
    * @group            : 
    * @created          : 13/12/2021 - 16:58:14
    * 
    * MODIFICATION LOG
    * - Version         : 1.0.0
    * - Date            : 13/12/2021
    * - Author          : fodf
    * - Modification    : 
**/
import { LightningElement, api } from 'lwc';

export default class RandomUser extends LightningElement {

    columns = [
        { label: 'Sexo', fieldName: 'sexo', type: 'text' },
        { label: 'Nome', fieldName: 'nome', type: 'text' },
        { label: 'Cidade', fieldName: 'cidade', type: 'text' },   
        { label: 'Estado', fieldName: 'estado', type: 'text' }
    ];

    data = [];
    fotoCandidato
    linkFotoCandidato;

    @api
    updateGrid(jsonCandidatos) {
        console.log('Inside updateGrid')
        this.lstCandidatosIncluidos = jsonCandidatos;
        console.log('jsonCandidatos: ' + jsonCandidatos);

        if(jsonCandidatos) {
            this.data = JSON.parse(jsonCandidatos);  

            console.log('random user data: ' + this.data);
        }
    }

    @api
    getLinkFotoCandidatofromParent(linkFotoCandidatoParent) {
        this.linkFotoCandidato = linkFotoCandidatoParent;
    }
}