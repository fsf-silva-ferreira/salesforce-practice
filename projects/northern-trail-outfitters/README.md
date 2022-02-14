# Northern Trail Outfitters Aura Sample Application

> IMPORTANT: This is the Aura version of the Northern Trail Outfitters sample application. If you are looking for a similiar industry use case with Lightning Web Components, visit the eBikes sample application [here](https://github.com/trailheadapps/ebikes-lwc).

![nto-logo](nto-logo.png)

[![CircleCI](https://circleci.com/gh/trailheadapps/northern-trail-outfitters.svg?style=svg)](https://circleci.com/gh/trailheadapps/northern-trail-outfitters)

Northern Trail Outfitters (NTO) is a fictional outdoor clothing company. This application helps NTO merchandisers create “merchandise mixes” for their large retailers . A merchandise mix is a collection of products a retailer carries for a season. Merchandise mixes are submitted to a Heroku-hosted sample manufacturing app using Platform Events. Regardless of the industry you work in, this app demonstrates how to build applications with Lightning Components and how to use Platform Events to integrate with external systems.

[![Thumbnail](http://img.youtube.com/vi/mdjDoDaKBEc/0.jpg)](https://www.youtube.com/watch?v=mdjDoDaKBEc)

Read [this blog post](https://developer.salesforce.com/blogs/developer-relations/2017/07/northern-trail-outfitters-new-sample-application-lightning-components-platform-events-salesforce-dx.html) to learn more about the application.

## Table of Contents

-   Installation
    -   [Installing Northern Trail Outfitters using Salesforce DX](#installing-northern-trail-outfitters-using-salesforce-dx)
    -   [Installing Northern Trail Outfitters using an unlocked package](#installing-northern-trail-outfitters-using-an-unlocked-package)
-   [Code Highlights](#code-highlights)
-   [Additional Resources](#additional-resources)

## Installation

There are two ways to install Northern Trail Outfitters:

-   Using Salesforce DX
-   Using an unlocked package

### Installing Northern Trail Outfitters using Salesforce DX

This is the recommended installation option for developers who want to experience the app and the code.

1.  Authenticate with your hub org (if not already done):

    ```zsh
    sfdx force:auth:web:login -d -a myhuborg
    ```

1.  Clone this repository:

    ```zsh
    git clone https://github.com/trailheadapps/northern-trail-outfitters
    cd northern-trail-outfitters
    ```

1.  Create a scratch org and provide it with an alias (nto):

    ```zsh
    sfdx force:org:create -s -f config/project-scratch-def.json -a nto
    ```

1.  Push the app to your scratch org:

    ```zsh
    sfdx force:source:push
    ```

1.  Assign the nto permission set to the default user:

    ```zsh
    sfdx force:user:permset:assign -n nto
    ```

1.  Load sample data:

    ```
    sfdx force:data:tree:import --plan ./data/Merchandise__c-plan.json
    sfdx force:data:tree:import --plan ./data/Account-Merchandising_Mix__c-plan.json
    ```

1.  Open the scratch org:

    ```
    sfdx force:org:open
    ```

1.  Select **Northern Trail Outfitters** in the App Launcher.

1.  Click the **Merchandise Mix** tab and select the first record.

### Installing Northern Trail Outfitters using an unlocked package

This is the recommended option for non developers. Use this option if you want to experience the sample app but do not plan to modify the code.

1.  [Sign up](https://developer.salesforce.com/signup) for a developer edition.

1.  Enable My Domain. Follow the instructions to enable My Domain [here](https://trailhead.salesforce.com/modules/identity_login/units/identity_login_my_domain).

1.  Click [this link](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t1I0000036tYKQAY) to install the Northern Trail Outfitters unlocked package into your developer edition org.

1.  Select **Install for All Users**. When prompted, make sure you grant access to the external sites (api.einstein.ai).

1.  Load sample data (Account):

    -   In **Setup**, type **Data Import** in the Quick Find box and click **Data Import Wizard**.
    -   Click **Launch Wizard**.
    -   Click **Accounts and Contacts**, and click **Add New Records**.
    -   Drag **account.csv** from the data folder of this project to the upload area.
    -   Click **Next**, **Next**, and **Start Import**.

1.  Load sample data (Merchandise):

    -   In **Setup**, type **Data Import** in the Quick Find box and click **Data Import Wizard**.
    -   Click **Launch Wizard**.
    -   Click the **Custom objects** tab, click **Merchandise**, and click **Add New Records**.
    -   Drag **merchandise.csv** from the data folder of this project to the upload area.
    -   Click **Next**, **Next**, and **Start Import**.

1.  Load sample data (Merchandise Mix):

    -   In **Setup**, type **Data Import** in the Quick Find box and click **Data Import Wizard**.
    -   Click **Launch Wizard**.
    -   Click the **Custom objects** tab, click **Merchandise Mix**, and click **Add New Records**.
    -   For Which Account field in your file do you want to match against to set the Account lookup field?, select **Account Name**.
    -   Drag **merchandise_mix.csv** from the data folder of this project to the upload area.
    -   Click **Next**, **Next**, and **Start Import**.

1.  Select **Northern Trail Outfitters** in the App Launcher.

1.  Click the **Merchandise Mix** tab and select the first record.

## Code Highlights

### Caching data with storable actions

Storable actions make it easy to implement client-side data caching, which is one of the most impactful things you can do to improve the performance of your Lightning components. Check out [MerchandiseListHelper](https://github.com/trailheadapps/northern-trail-outfitters/blob/master/force-app/main/default/aura/MerchandiseList/MerchandiseListHelper.js) and [MerchandiseMixHelper](https://github.com/trailheadapps/northern-trail-outfitters/blob/master/force-app/main/default/aura/MerchandiseMix/MerchandiseMixHelper.js). A storable action is used to retrieve funds from the server and cache the response at the client-side. Read [this blog post](https://developer.salesforce.com/blogs/developer-relations/2017/03/lightning-components-best-practices-caching-data-storable-actions.html) for more information.

### Caching data with a custom cache

In addition to storable actions, you can also build your own custom cache solution. For example, for data that never (or rarely) changes, you can build a custom cache that retrieves the data from the server once, caches the response, and never goes back to the server. Check out the [DataCache](force-app/main/default/staticresources/DataCache.js) static resource for an example. And then check out the [CategorySelector](https://github.com/trailheadapps/northern-trail-outfitters/tree/master/force-app/main/default/aura/CategorySelector) component to see how it’s used to cache the list of categories. Read the [Modularizing Code in Lightning Components blog post](https://developer.salesforce.com/blogs/developer-relations/2016/12/lightning-components-code-sharing.html) for more details, and for different strategies to implement a custom cache.

### Using Base Lightning Components

Custom user interfaces are built by leveraging Base Lightning Components like [lightning:path](https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/aura_compref_lightning_path.htm). This simplifies the development experience as validations, CSS-styling and and data handling are automatically handled by the platform. See the [MixPath](force-app/main/default/aura/MixPath) component for an example.

### Third-party JavaScript libraries and standard HTML5 interactions

The [MixChart](https://github.com/trailheadapps/northern-trail-outfitters/blob/master/force-app/main/default/aura/MixChart) component shows how a third-party library like [ChartJS](https://www.chartjs.org/) can be used within Lightning Experience. The [MerchandiseMix](force-app/main/default/aura/MerchandiseMix) component provides another example and uses the [countUp.js](https://github.com/inorganik/countUp.js/) library. MerchandiseMix also shows how to use standard HTML 5 functionality like [drag & drop](https://developer.mozilla.org/en-US/docs/Web/API/HTML_Drag_and_Drop_API).

## Additional Resources

Install the [Northern Trail Outfitters Manufacturing](https://github.com/trailheadapps/northern-trail-manufacturing) app to experiment with platform event-based integration.

When you create a Merchandise Mix in Salesforce and change its status to **Submitted to Manufacturing**, the **Mix Status Change** process automatically publishes the **Mix_Submitted\_\_e** platform event. The manufacturing app is listening for that event and automatically adds the merchandise mix to the mix list when a **Mix_Submitted\_\_e** event comes in.

When you click the **Approve** button next to a merchandise mix in the manufacturing app, the manufacturing app publishes a **Mix_Approved\_\_e** event. The **Mix Status Change** process (in Process Builder) listens for that event and automatically changes the bundle status to **Approved by Manufacturing** when an event comes in. If a user is looking at the record details page for that mix, the status will automatically change (no page refresh required) because the status path component is using the Streaming API to listen for status changes. For this last part to work, you need to execute the following Salesforce DX command to create the Streaming API topic:

```
sfdx force:apex:execute -f ./apex/createPushTopic.apex
```

Take a look at the `createPushTopic.apex` file in the `/apex` folder to examine the push topic creation logic.

Note that you could also have listened directly for the platform event in the status path component and update the status to **Approved by Manufacturing** in the UI when the event comes in. However, that approach could lead to inconsistencies in case the server-side status update (handled by the **Mix Status Change** process) fails, because a validation rule is not met for example. In that case the UI would show the status as **Approved by Manufacturing**, while the status in the database would still be **Submitted to Manufacturing**.
