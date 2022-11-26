// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/Test.sol";
import "src/Logic.sol";
import "src/Proxy.sol";


contract createMockTokens is Test, Script {
    address proxyAdmin = msg.sender;
    address logicAdmin = address(1); // oops
    
    CTFLogic logic;
    CTFProxy proxy;

    function run() public {
        vm.startBroadcast(msg.sender);

        logic = new CTFLogic();
        proxy = new CTFProxy(
            address(logic), // Setup implement
            proxyAdmin,     // Setup TPP proxyAdmin
            logicAdmin      // Setup logic contract owner
        );

        vm.stopBroadcast();

        emit log_named_address("CTF Challenge Proxy Address:", address(proxy));
        emit log_named_address("CTF Challenge Logic Address:", address(logic));
        emit log_named_address("Transparent Proxy Admin:", proxyAdmin);
        emit log_named_address("Logic Contract Owner:", logicAdmin);
    }
}
