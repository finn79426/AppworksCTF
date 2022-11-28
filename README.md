# Appworks Blockchain CTF

This challenge have at least 2 issues, your goal is calls `Logic.isChallengeSolve()` and expect no EVM revert.

```
git clone --recursive https://github.com/finn79426/AppworksCTF.git
```

# Info

- Deployed on Goerli Network

```
CTF Challenge Proxy Address:: 0x491909c893307049016674052aC865C9c7869C73
CTF Challenge Logic Address:: 0x6693CcC506CB082019B051DC30C0E570fB5c21c0
```

```
Proxy Admin Address:: 0x1804c8ab1f12e6bbf3894d4083f33e07309d1f38 (is random address, not important)
Logic Contract Owner:: 0x0000000000000000000000000000000000000001
```

# Deploy

自動化部屬腳本：

```
forge script --rpc-url https://rpc.ankr.com/eth_goerli --private-key <MyPrivateKey> script/deploy.sol --broadcast --verifier etherscan
```

但是不知道為什麼 Foundry 返回 Contract Verify Success 但是 Etherscan 卻沒有顯示驗證成功，之前明明都可以的@@

---

後面改手動部署就可以 Verifiy 了。

部屬 Logic：
```
╰─ forge create --rpc-url https://rpc.ankr.com/eth_goerli --private-key <MyPrivateKey> ./src/Logic.sol:CTFLogic --verify 
[⠆] Compiling...
No files changed, compilation skipped
Deployer: 0x5f36131717Cd657e04cA6aEd38D230F72547415C
Deployed to: 0x6693CcC506CB082019B051DC30C0E570fB5c21c0
Transaction hash: 0x83d2ef0d1e55753d2fd3f3ef12245aed7fdb43315ef36d616592453c4093f0a0
Starting contract verification...
Waiting for etherscan to detect contract deployment...
Start verifying contract `0x6693ccc506cb082019b051dc30c0e570fb5c21c0` deployed on goerli

Submitting verification for [src/Logic.sol:CTFLogic] "0x6693CcC506CB082019B051DC30C0E570fB5c21c0".
Submitted contract for verification:
        Response: `OK`
        GUID: `ppm8daiccfgcd8pywhdyp5dlmpqdbdrqclxsf98tci74eynq4l`
        URL:
        https://api-goerli.etherscan.io/apiaddress/0x6693ccc506cb082019b051dc30c0e570fb5c21c0
Contract verification status:
Response: `NOTOK`
Details: `Pending in queue`
Contract verification status:
Response: `OK`
Details: `Pass - Verified`
Contract successfully verified
```

部屬 Proxy：

```
╰─ forge create --rpc-url https://rpc.ankr.com/eth_goerli --private-key <MyPrivateKey> ./src/Proxy.sol:CTFProxy --constructor-args "0x6693CcC506CB082019B051DC30C0E570fB5c21c0" "0x1804c8ab1f12e6bbf3894d4083f33e07309d1f38" "0x0000000000000000000000000000000000000001" --verify
[⠆] Compiling...
No files changed, compilation skipped
Deployer: 0x5f36131717Cd657e04cA6aEd38D230F72547415C
Deployed to: 0x491909c893307049016674052aC865C9c7869C73
Transaction hash: 0x9a77a9c20c3ca6a234b701703c7382ed1cbe213b25b601f1cae455fc7e1322a5
Starting contract verification...
Waiting for etherscan to detect contract deployment...
Start verifying contract `0x491909c893307049016674052ac865c9c7869c73` deployed on goerli

Submitting verification for [src/Proxy.sol:CTFProxy] "0x491909c893307049016674052aC865C9c7869C73".

Submitting verification for [src/Proxy.sol:CTFProxy] "0x491909c893307049016674052aC865C9c7869C73".
Submitted contract for verification:
        Response: `OK`
        GUID: `pnqzccsnp177zkz1yl5fh3v2txsh1ei5gwbdeynjqkp6undq2b`
        URL:
        https://api-goerli.etherscan.io/apiaddress/0x491909c893307049016674052ac865c9c7869c73
Contract verification status:
Response: `NOTOK`
Details: `Pending in queue`
Contract verification status:
Response: `NOTOK`
Details: `Already Verified`
Contract source code already verified
```
