# cfml-ip

## Ip address help library

This is a helper library which will give you back information for a provided subnet.

```
//inject ip helper
property name="ip" inject="ip@cfml-ip"

...

//usage
var subnet = ip.subnet("192.168.0.1/24"); 
// or another method signature:
var subnet = ip.subnet("192.168.0.1", "255.255.255.0");

/*
subnet will equal:
{
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

//You can access a method called 'contains' on the returned structure to check if a give ip address in the subnet.
var isInRange = subnet.contains('192.168.0.4') //true
var isInRange = subnet.contains('192.168.2.9') //false
```

This package uses the apache common net jar.
https://commons.apache.org/proper/commons-net/