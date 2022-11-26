// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract CTFProxy is TransparentUpgradeableProxy {
    address private proxyAdmin;
 
    constructor(address _logic, address _proxyAdmin, address _logicOwner)
        TransparentUpgradeableProxy(
            _logic,
            _proxyAdmin,
            abi.encodeWithSelector(bytes4(0xc4d66de8), _logicOwner) // bytes4(keccak256("initialize(address)"))            
    ) {
      proxyAdmin = _proxyAdmin;
    }


}

