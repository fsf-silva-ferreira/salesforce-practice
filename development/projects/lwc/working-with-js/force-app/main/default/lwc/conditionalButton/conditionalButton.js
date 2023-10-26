import { LightningElement } from 'lwc';


export default class ConditionalButton extends LightningElement {

    show = false;

    handleClick(){
        this.show = !this.show;
    }
}