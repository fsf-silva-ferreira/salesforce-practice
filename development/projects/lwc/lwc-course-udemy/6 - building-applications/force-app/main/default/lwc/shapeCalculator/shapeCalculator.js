import { LightningElement } from 'lwc';

export default class ShapeCalculator extends LightningElement {

    //Message for the calculation result
    currentOutput;

    //Shape properties
    width;
    height;
    side;
    diagonal1;
    diagonal2;


    //Event handlers
    sideChangeHandler(event) {
        this.side = event.target.value;
    }

    widthChangeHandler(event) {
        this.width = event.target.value;
    }

    heightChangeHandler(event) {
        this.height = event.target.value;
    }

    diagonal1ChangeHandler(event) {
        this.diagonal1 = event.target.value;
    }

    diagonal2ChangeHandler(event) {
        this.diagonal2 = event.target.value;
    }

    calculateSquareAreaHandler() {        
        const side = parseInt(this.side);
        const squareArea = side * side;

        this.currentOutput =  'Area of the square is: ' + squareArea;
    }

    calculateRectangleAreaHandler() {
        const width = parseInt(this.width);
        const height = parseInt(this.height);
        const rectangleArea = width * height;

        this.currentOutput = 'Area of the rectangle is ' + rectangleArea;
    }

    calculateRhombusAreaHandler() {
        const diagonal1 = this.diagonal1;
        const diagonal2 = this.diagonal2;
        const rhombusArea = (diagonal1 * diagonal2)/2;

        this.currentOutput = 'Area of the rhombus is '+ rhombusArea;
    }
}