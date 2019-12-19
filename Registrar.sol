pragma solidity >=0.4.22 <0.6.0;

contract Registrar {

    struct identity {
        uint8 id;
        string name;
        uint8 noOfDevices;
        bool whitelist;
        bool blacklist;
        bool greylist;
    }

    mapping(address => identity) register;

    function registerOrganisation(address owner, uint8 id, string memory name, uint8 noOfDevices) public {
            register[owner].id = id;
            register[owner].name = name;
            register[owner].whitelist = true;
            register[owner].blacklist = true;
            register[owner].noOfDevices = noOfDevices;
    }

    function getOrganisationID(address owner) public view returns (uint8) {
            return register[owner].id;
        }

    function isOrganisationWhitelisted(address owner) public view returns (bool) {
            return register[owner].whitelist;
        }

     function isOrganisationBlacklisted(address owner) public view returns (bool) {
            return register[owner].blacklist;
        }

    function checkID(address owner, uint8 id) public view returns (bool) {
            return register[owner].id == id;
    }

    function blacklistCompany(address owner) public {
            register[owner].blacklist = true;
            register[owner].whitelist = false;
            register[owner].greylist = false;
    }

    function whitelistCompany(address owner) public {
            register[owner].blacklist = false;
            register[owner].whitelist = true;
            register[owner].greylist = false;
    }

    function greylistCompany(address owner) public {
            register[owner].blacklist = false;
            register[owner].whitelist = false;
            register[owner].greylist = true;
    }

    function updateID(address owner, uint8 newID) public {
            register[owner].id = newID;
    }

    function updateName(address owner, string memory name) public {
            register[owner].name = name;
    }

    function deleteOrganisation(address owner) public {
            delete register[owner];
        }

    function updateNoOfDevices(address owner, uint8 newNoOfDevices) public {
            register[owner].noOfDevices = newNoOfDevices;
        }
}
