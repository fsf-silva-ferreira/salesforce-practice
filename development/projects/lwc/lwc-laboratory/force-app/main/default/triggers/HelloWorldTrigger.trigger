trigger HelloWorldTrigger on Account (before update, before insert) {
	System.debug('Alterando a conta: ' + trigger.new[0].name);
    
    for(Account acc : trigger.new) {
    	acc.Rating = 'Hot';

        System.debug('Conta ' + acc.name + ' alterada em ' + Datetime.now());
    }
}