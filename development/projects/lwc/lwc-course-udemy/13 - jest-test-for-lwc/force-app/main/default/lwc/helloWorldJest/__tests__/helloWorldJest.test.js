import { createElement } from 'lwc';
import HelloWorldJest from 'c/helloWorldJest';


/*
    JEST installation process:
    1 - Install Node.js.
    2 - Install npm plugin from VS Code.
    3 - In terminal run 'npm install' command.
    4 - In terminal run 'npm install --save-dev jest' command.
*/
describe('c-hello-world-jest', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    //Test passed example
    it('Displays greeting', () => {
        const element = createElement('c-hello-world-jest', {is: HelloWorldJest});
        document.body.appendChild(element);
        const pTag = element.shadowRoot.querySelector('p');
        expect(pTag.textContent).toBe('Hello, World!');
    });

    //Test failed example
    it('Renders with Hello Matt', () => {
        const element = createElement('c-hello-world-jest', {is: HelloWorldJest});
        element.person = 'Matt';
        document.body.appendChild(element);
        const pTag = element.shadowRoot.querySelector('p');
        expect(pTag.textContent).toEqual('Hello, Matt!');
    });
});