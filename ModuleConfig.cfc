component {
    
    this.name = "cfml-ip";
    this.author = "";
    this.webUrl = "https://github.com/ryanalbrecht/cfml-ip";
    this.modelNamespace = "cfml-ip";
    this.cfmapping = "cfml-ip";    
    this.dependencies = [ "cbjavaloader" ];

    function configure() {
        //javaloader settings
        settings = {
        	libPath : modulePath & "/models/lib",
        }
    }

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){
		// Class load bcrypt
		wireBox.getInstance( "loader@cbjavaloader" ).appendPaths( settings.libPath );
	}

}