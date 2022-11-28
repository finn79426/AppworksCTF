# Appworks Blockchain CTF

This challenge have at least 2 issues, your goal is calls `Logic.isChallengeSolve()` and expect no EVM revert.

```
git clone --recursive https://github.com/finn79426/AppworksCTF.git
```

# Info

- Deployed on Goerli Network

```
CTF Challenge Proxy Address:: 0xdcbdf6c8520d5366abd2150dff45da90002b4436
CTF Challenge Logic Address:: 0x02acdf6d39451ed2a8c065fb3a027e89b7edeee8
```

```
Proxy Admin Address:: 0x1804c8ab1f12e6bbf3894d4083f33e07309d1f38 (is random address, not important)
Logic Contract Owner:: 0x0000000000000000000000000000000000000001
```

# Deploy

```
forge script --rpc-url https://rpc.ankr.com/eth_goerli --private-key <MyPrivateKey> script/deploy.sol --broadcast --verifier etherscan
```

不知道為什麼 Foundry 返回 Contract Verify Success 但是 Etherscan 卻沒有顯示驗證成功，之前明明都可以的@@

Foundry 突然壞掉(?
