/**
    * @description      : 
    * @author           : fodf
    * @group            : 
    * @created          : 13/12/2021 - 09:50:44
    * 
    * MODIFICATION LOG
    * - Version         : 1.0.0
    * - Date            : 13/12/2021
    * - Author          : fodf
    * - Modification    : 
**/
import { LightningElement, api } from 'lwc';

export default class DadosCandidato extends LightningElement {

    columns = [
        { label: 'Nome', fieldName: 'nomeCandidato', type: 'text' },
        { label: 'Sexo', fieldName: 'sexoCandidato', type: 'text' },
        { label: 'Cargo', fieldName: 'cargoCandidato', type: 'text' },
        {
            type: 'button',
            typeAttributes : {
                label: 'Ver foto',
                name: 'View',
                value: 'View'
            }
        }
    ];

    data = [];
    sexo;
    cargo;
    fotoCandidato;
    linkFotoCandidato;

    onRowAction(event){
        let nomeCandidato = event.detail.row.nomeCandidadto;
        let sexoCandidato = event.detail.row.sexoCandidato;
        let cargoCandidato = event.detail.row.cargoCandidato;

        console.log('Nome ' + nomeCandidato); 
        console.log('Sexo ' + sexoCandidato);   
        console.log('Cargo ' + cargoCandidato);          
    }

    lstCandidatosIncluidos;

    @api
    updateDataTable(jsonCandidatos) {
        this.lstCandidatosIncluidos = jsonCandidatos;

        if(jsonCandidatos) {
            this.data = JSON.parse(jsonCandidatos);
        }
    }
}