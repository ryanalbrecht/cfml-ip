component singleton {

	//inject javaloader
	property name="javaLoader" inject="loader@cbjavaloader";

	IP function init() {
		return this;
	}

	function subnet(required ipAddress, subnetMask){
		var subnetUtils = variables.javaLoader.create("org.apache.commons.net.util.SubnetUtils")

		if(isDefined('arguments.subnetMask')){
			var subnet = SubnetUtils.init(ipAddress, subnetMask).getInfo();
		}else{
			var subnet = SubnetUtils.init(ipAddress).getInfo();
		}
		
		var r = structNew('Ordered');
		r['address'] 			= subnet.getAddress();
		r['numHosts'] 			= subnet.getAddressCountLong();
		r['broadcastAddress'] 	= subnet.getBroadcastAddress();
		r['networkAddress'] 	= subnet.getNetworkAddress();
		r['subnetMask'] 		= subnet.getNetMask();
		r['cidrSignature'] 		= subnet.getCidrSignature();
		r['firstAddress'] 		= subnet.getLowAddress();
		r['lastAddress'] 		= subnet.getHighAddress();
		r['allAddresses'] 		= subnet.getAllAddresses();
		r['contains'] 			= function(addr){
				return subnet.isInRange(arguments.addr);
		}

		return r;
	}

}