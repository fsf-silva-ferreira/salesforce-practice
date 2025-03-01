/**
 * @description       : Working with Sets and Maps.
 * @author            : Flávio Ferreira
 * @group             : 
 * @last modified on  : 11-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Tea {

    public static void orderTea() {
        Set<String> teaTypes = new Set <String>{'Black', 'White', 'Herbal'};
        system.debug('The set of tea types before adding new items: ' + teaTypes);
        teaTypes.add('Green');
        teaTypes.add('Black');
        system.debug('The set of tea types after adding new items: ' + teaTypes);
    }

    public static void getTeaFlavorsByType() {
        Map <String, String> teaTypes = new Map <String, String>();
        teaTypes.put('Black', 'Earthy');
        teaTypes.put('White', 'Sweet');
        teaTypes.put('Herbal', 'Sweet');

        system.debug('Tea flavors - as values - by type - as key: ' + teaTypes);
    }

    public static String orderHerbalTea() {
        Map <String, String> teaTypes = new Map <String, String>();
        teaTypes.put('Black', 'Earthy');
        teaTypes.put('White', 'Sweet');
        teaTypes.put('Herbal', 'Sweet');

        String flavorProfile = teaTypes.get('Herbal');
        System.debug('The flavorProfile of Herbal is: ' + flavorProfile);

        return flavorProfile;
    }
}