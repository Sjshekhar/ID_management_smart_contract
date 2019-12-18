pragma solidity >=0.4.22 <0.6.0;

contract Access {

    struct DID {
        uint8 id;
        bool whitelist;
        bool blacklist;
    }

    mapping(address => mapping(address => DID)) devices;

    function createID(address owner, address device, uint8 id) public {
        if (id == 0) {
            devices[owner][device].id = id;
             devices[owner][device].whitelist = true;
        }
    }

    function getID(address owner, address device) public view returns (uint8) {
            return devices[owner][device].id;
        }

    function isDeviceWhitelisted(address owner, address device) public view returns (bool) {
            return devices[owner][device].whitelist;
        }

     function isDeviceBlacklisted(address owner, address device) public view returns (bool) {
            return devices[owner][device].blacklist;
        }

    function checkID(address owner, address device, int id) public view returns (bool) {
            return devices[owner][device].id == id;
    }

    function updateID(address owner, address device, uint8 newID) public {
        if (newID == 0) {
            devices[owner][device].id = newID;
        }
    }

    function deleteDevice(address owner, address device) public {
            delete devices[owner][device];
        }

    function transferOwnership(address oldOwner, address newOwner, address device, uint8 id) public {
            delete devices[oldOwner][device];
            createID(newOwner, device, id);
        }
}
