
[![Build Status](https://travis-ci.org/coldbox-modules/cbox-javaloader.svg?branch=development)](https://travis-ci.org/coldbox-modules/cbox-javaloader)

# Welcome to the cfml-ip Project

The cfml-ip module will help you retrieve info for a given ip and subnet. This package utilizes the apache commons net jar. [https://commons.apache.org/proper/commons-net/](https://commons.apache.org/proper/commons-net/)

## License

I dont know about licenses, do whatever you want.

## Instructions

Just drop into your **modules** folder or use the box-cli to install

`box install cfml-ip`

## Models

The module registers the following mapping in WireBox: `ip@cfml-ip`. Which is the class you will use to parse ip addresses and subnets. The class has one method, with two signatures.

* `subnet( ipAddress, subnetmask )` - Parse ip address with a given subnetmask
* `subnet( cidrString )` - Parse cidr signature.

This returned value a struct with the subnet information along with a helper function called 'contains' to determine if an ip address is in the given range. 

Below is a simple example:

```js
component{
  // Inject cfml-ip
  property name="ip" inject="ip@cfml-ip";

  any function myFancyFunction( ){
    
    var subnet = ip.subnet('192.168.0.1/24'); // or ip.subnet('192.168.0.1', '255.255.255.0')
    
    /*
        subnet = {
          "address": "192.168.0.1",
          "numHosts": 254,
          "broadcastAddress": "192.168.0.255",
          "networkAddress": "192.168.0.0",
          "subnetMask": "255.255.255.0",
          "cidrSignature": "192.168.0.1/24",
          "firstAddress": "192.168.0.1",
          "lastAddress": "192.168.0.254",
          "allAddresses": [
            "192.168.0.1",
            "192.168.0.2",
            ...
            "192.168.0.253".
            "192.168.0.254"
          ],
          "contains": function(ipAddress){ }
        } 
    */
    
    var isInRange = subnet.contains('192.168.0.4') //true
    var isInRange = subnet.contains('192.168.2.9') //false

  }
}
```