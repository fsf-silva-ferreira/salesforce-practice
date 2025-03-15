<aura:application>
    <link href='/resource/bootstrap_full' rel="stylesheet" />
    
    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a href="#" class="navbar-brand">Lightning Contacts</a>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <c:searchBar/>
                <c:contactList/>
            </div> 
            <div class="col-sm-8">
                <c:contactDetails/>
            </div>   
        </div>
    </div>
</aura:application>