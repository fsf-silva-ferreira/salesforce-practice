import { LightningElement } from 'lwc';
import processTransition from '@salesforce/apex/SampleApexController.processTransition';

export default class SpinnerTransition extends LightningElement {

    //Status control variables
    isLoading = false;
    showSectionOne = true;
    showSectionTwo = false;


    //Event handlers
    handleButtonClick() {
        // 1. Turning on spinner
        this.isLoading = true;

        // 2. Short delay (0ms is enough) to "unlock" UI        
        setTimeout(() => {
            this.switchModalWindows();
        }, 3000);
    }


    //Custom logic
    async switchModalWindows() {
        try {
            // Imperative Apex call
            await processTransition();
            
            // Sucess: Screen transition
            this.showSectionOne = false;
            this.showSectionTwo = true;
        } catch (error) {
            console.error('Erro na API:', error);
        } finally {
            // Turning off spinner
            this.isLoading = false;
        }
    }
}