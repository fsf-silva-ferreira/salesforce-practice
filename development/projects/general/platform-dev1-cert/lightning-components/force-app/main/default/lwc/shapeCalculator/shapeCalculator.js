import { LightningElement } from 'lwc';

export default class ShapeCalculator extends LightningElement {

    currentOutput;
    width;
    height;
    side;
    diagonal1;
    diagonal2;


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

    calculateSquareHandler() {
        const side = parseInt(this.side);
        this.currentOutput = 'Area of the square is: ' + (side * side);
    }

    calculateRectangleAreaHandler() {
        const width = parseInt(this.width);
        const height = parseInt(this.height);

        this.currentOutput = 'Area of the rectangle is: ' + (width * height);
    }

    calculateRhombusAreaHandler() {
        const diagonal1 = parseInt(this.diagonal1);
        const diagonal2 = parseInt(this.diagonal2);

        this.currentOutput = 'Area of the square is: ' + (diagonal1 * diagonal2)/2;
    }
}