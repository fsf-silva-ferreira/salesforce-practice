/* Contém toda a lógica */
({
	getData: function (component, event, helper) {
		var action = component.get('c.getAllVehicles');
		action.setCallback(this, function (response) {
			var state = response.getState();

			if (state == "SUCCESS") {
				var result = response.getReturnValue();
				component.set('v.listCars', result);
				console.log('Vehicle list successfully loaded.');
			} else
			if (state == "ERROR") {
				console.log(response.getError());
			} else {
				console.log(response);
			}
		});

		$A.enqueueAction(action);
	}
})