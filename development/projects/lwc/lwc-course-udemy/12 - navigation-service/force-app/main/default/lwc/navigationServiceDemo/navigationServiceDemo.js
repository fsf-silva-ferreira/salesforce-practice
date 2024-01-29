import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigationServiceDemo extends NavigationMixin(LightningElement) {

    //recordId must be public to make page communication happen
    @api
    recordId;

    /*
        Commons errors found:
        - Only one underscore (_) in type property value
        - Lower case first letter of "Navigate" 
        - "recordId" property misspelled: recodId
    */
    navigateToNewRecordPage() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.recordId,
                    objectApiName: 'Account',
                    actionName: 'new'
                }
            }
        );
    }

    navigateEditRecordPage() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.recordId,
                    objectApiName: 'Account',
                    actionName: 'edit'
                }
            }
        );
    }

    navigateToViewRecordPage() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.recordId,
                    objectApiName: 'Account',
                    actionName: 'view'
                }
            }
        );
    }

    navigateToRecenttListView() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Account',
                    actionName: 'list'
                },
                state: {
                    filterName: 'Recent'
                }
            }
        );
    }

    navigateToRelatedListView() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__recordRelationshipPage',
                attributes: {
                    recordId: this.recordId,
                    objectApiName: 'Account',
                    relationshipApiName: 'Contacts',
                    actionName: 'view'
                 }
            }
        );
    }

    navigateToAccountPage() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Account',
                    actionName: 'home'
                }
            }
        );
    }

    navigateToContactPage() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Contact',
                    actionName: 'home'
                }
            }
        );
    }

    navigateToWebPage() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__webPage',
                attributes: {
                    url: 'https://www.mytutorialrack.com'
                }
            }
        );
    }

    navigateToHomePage() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__namedPage',
                attributes: {
                    pageName: 'home'
                }
            }
        );
    }

    navigateToChatterPage() {
        this[NavigationMixin.Navigate](
            {
                type: 'standard__namedPage',
                attributes: {
                    pageName: 'chatter'
                }
            }
        );
    }
}