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
import getCandidate from '@salesforce/apex/ChallengeController.getCandidate';

export default class DadosCandidato extends LightningElement {

    columns = [
        { label: 'Nome', fieldName: 'nomeCandidato', type: 'text' },
        { label: 'Cargo', fieldName: 'cargoCandidato', type: 'text' },
        { label: 'Sexo', fieldName: 'sexoCandidato', type: 'text' },   
        { label: 'CPF', fieldName: 'cpfCandidato', type: 'text' },     
        { label: 'Telefone', fieldName: 'foneCandidato', type: 'text' }
    ];

    data = [];
    sexoCandidato;

    /*
    onChangeAction(event){
        let nomeCandidato = event.detail.row.nomeCandidadto;
        let sexoCandidato = event.detail.row.sexoCandidato;
        let cargoCandidato = event.detail.row.cargoCandidato;

        console.log('Nome ' + nomeCandidato); 
        console.log('Sexo ' + sexoCandidato);   
        console.log('Cargo ' + cargoCandidato);       
        
        getCandidate( { sexo : sexoCandidato } )
            .then( (result) => {
                console.log('result=>', result)
                let objResult = JSON.parse(result);

                if(preferenciaTipoPET == 'Masculino') {
                    console.log('URL homem ' + objResult[0].url)
                    this.linkFotoCandidato = objResult[0].url;
                } else {
                    console.log('URL mulher ' + objResult.message)
                    this.linkFotoCandidato = objResult.message;
                }           
            });
    }*/

    lstCandidatosIncluidos;
    sexoCandidato;
    dadosApi;

    @api
    updateDataTable(jsonCandidatos) {
        this.lstCandidatosIncluidos = jsonCandidatos;

        if(jsonCandidatos) {
            this.data = JSON.parse(jsonCandidatos);  
            
            console.log('Chamando API ...');

            let newCandidate = this.breakList(this.lstCandidatosIncluidos);

            this.callApi(newCandidate);

            console.log('Nome: ' + this.dadosApi.results[0].name.first);
        }
    }

    callApi(sexo) {
        console.log('Inside the callAPI() - new candidate: ' + sexo);

        if(sexo.includes('Masculino')) {
            console.log('Masculino');
            this.sexoCandidato = 'Masculino';
        } else {
            console.log('Feminino');
            this.sexoCandidato = 'Feminino';
        }

        getCandidate( { sexo : this.sexoCandidato } )
            .then( (result) => {
                //console.log('result=>', result)
                this.dadosApi = JSON.parse(result);

                console.log('Retorno da API: ' + this.dadosApi.results[0].name.first);            
            });        
    }

    breakList(list) {
        const arrayVar = list.split("},");

        return arrayVar[arrayVar.length-1];
    }
}