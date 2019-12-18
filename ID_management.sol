pragma solidity >=0.4.22 <0.6.0;

contract Access {

    struct Did {
        uint8 id;
    }

    address iotDevice;
    mapping(address => Did) devices;

    function registerDevice(address device, uint8 id) public {
        if (id == 0) {
            devices[device].id = id;
        }
    }

    function getID(address device) public view returns (uint8){
            return devices[device].id;
        }

    function checkID(address device, int id) public view returns (bool){
         if(devices[device].id == id) {
            return true;
        }
         else {
             return false;
         }
    }

    function changeID(address device, uint8 newID) public {
        if (newID == 0) {
            devices[device].id = newID;
        }
    }
}
