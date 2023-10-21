public class UpdateContactPageLayout {

    // Add custom field to page layout
    public Metadata.Layout addLayoutItem() {
        // Retrieve Contact layout and section
		List<Metadata.Metadata> layoutsList = Metadata.Operations.retrieve(Metadata.MetadataType.Layout, 
			new List<String> {'Contact-Contact Layout'});
        Metadata.Layout layoutMetadata = (Metadata.Layout) layoutsList.get(0);
        
        Metadata.LayoutSection contactLayoutSection = null;
        List<Metadata.LayoutSection> layoutSections = layoutMetadata.layoutSections;
        for (Metadata.LayoutSection section : layoutSections) {
            if (section.label == 'Additional Information') {
                contactLayoutSection = section;
                break;
            }
        }
        
        // Add the field under "Additional Information" section in the left column
        List<Metadata.LayoutColumn> contactColumns = contactLayoutSection.layoutColumns;     
        List<Metadata.LayoutItem> contactLayoutItems = contactColumns.get(0).layoutItems;
        
        // Create a new layout item for the new field
        Metadata.LayoutItem newField = new Metadata.LayoutItem();
        newField.behavior = Metadata.UiBehavior.Edit;
        newField.field = 'AMAPI__Apex_MD_API_Twitter_name__c';
        
        contactLayoutItems.add(newField);
        
        return layoutMetadata;
    }
}