pragma solidity >=0.4.22 <0.6.0;

contract Registrar {

    struct identity {
        uint8 id;
        string name;
        uint8 noOfDevices;
        bool whitelist;
        bool blacklist;
        bool greylist;
        string businessModel;
    }

    mapping(address => identity) register;

    function registerOrganisation(address organisation, uint8 id, string memory name, uint8 noOfDevices, string memory businessModel) public {
            register[organisation].id = id;
            register[organisation].name = name;
            register[organisation].whitelist = true;
            register[organisation].blacklist = true;
            register[organisation].noOfDevices = noOfDevices;
            register[organisation].businessModel = businessModel;
    }

    function getOrganisationID(address organisation) public view returns (uint8) {
            return register[organisation].id;
        }

    function isOrganisationWhitelisted(address organisation) public view returns (bool) {
            return register[organisation].whitelist;
        }

     function isOrganisationBlacklisted(address organisation) public view returns (bool) {
            return register[organisation].blacklist;
        }

    function checkID(address organisation, uint8 id) public view returns (bool) {
            return register[organisation].id == id;
    }

    function blacklistCompany(address organisation) public {
            register[organisation].blacklist = true;
            register[organisation].whitelist = false;
            register[organisation].greylist = false;
    }

    function whitelistCompany(address organisation) public {
            register[organisation].blacklist = false;
            register[organisation].whitelist = true;
            register[organisation].greylist = false;
    }

    function greylistCompany(address organisation) public {
            register[organisation].blacklist = false;
            register[organisation].whitelist = false;
            register[organisation].greylist = true;
    }

    function updateID(address organisation, uint8 newID) public {
            register[organisation].id = newID;
    }

    function updateName(address organisation, string memory name) public {
            register[organisation].name = name;
    }

    function deleteOrganisation(address organisation) public {
            delete register[organisation];
        }

    function updateNoOfDevices(address organisation, uint8 newNoOfDevices) public {
            register[organisation].noOfDevices = newNoOfDevices;
        }
}
