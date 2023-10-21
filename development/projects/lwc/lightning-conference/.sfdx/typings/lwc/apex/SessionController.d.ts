declare module "@salesforce/apex/SessionController.getSessions" {
  export default function getSessions(param: {searchKey: any}): Promise<any>;
}
declare module "@salesforce/apex/SessionController.getSession" {
  export default function getSession(param: {sessionId: any}): Promise<any>;
}
