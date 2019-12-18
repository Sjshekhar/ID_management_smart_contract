pragma solidity >=0.4.22 <0.6.0;

contract Identity {

    struct DID {
        uint8 id;
        bool whitelist;
        bool blacklist;
        bool greylist;
    }

    mapping(address => mapping(address => DID)) devices;

    function createID(address owner, address device, uint8 id) public {
            devices[owner][device].id = id;
            devices[owner][device].whitelist = true;
            devices[owner][device].blacklist = false;
            devices[owner][device].greylist = false;
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

    function checkID(address owner, address device, uint8 id) public view returns (bool) {
            return devices[owner][device].id == id;
    }

    function blacklistDevice(address owner, address device) public {
            devices[owner][device].blacklist = true;
            devices[owner][device].whitelist = false;
            devices[owner][device].greylist = false;
    }

    function whitelistDevice(address owner, address device) public {
            devices[owner][device].blacklist = false;
            devices[owner][device].whitelist = true;
            devices[owner][device].greylist = false;
    }

     function greylistDevice(address owner, address device) public {
            devices[owner][device].blacklist = false;
            devices[owner][device].whitelist = false;
            devices[owner][device].greylist = true;
    }

    function updateID(address owner, address device, uint8 newID) public {
            devices[owner][device].id = newID;
    }

    function deleteDevice(address owner, address device) public {
            delete devices[owner][device];
        }

    function transferOwnership(address oldOwner, address newOwner, address device, uint8 id) public {
            delete devices[oldOwner][device];
            createID(newOwner, device, id);
        }
}
