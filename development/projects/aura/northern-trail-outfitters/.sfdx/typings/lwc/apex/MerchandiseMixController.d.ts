declare module "@salesforce/apex/MerchandiseMixController.getMixItems" {
  export default function getMixItems(param: {mixId: any}): Promise<any>;
}
declare module "@salesforce/apex/MerchandiseMixController.addMixItem" {
  export default function addMixItem(param: {mixId: any, productId: any, qty: any}): Promise<any>;
}
declare module "@salesforce/apex/MerchandiseMixController.updateMixItem" {
  export default function updateMixItem(param: {mixItem: any}): Promise<any>;
}
declare module "@salesforce/apex/MerchandiseMixController.removeMixItem" {
  export default function removeMixItem(param: {mixItemId: any}): Promise<any>;
}
