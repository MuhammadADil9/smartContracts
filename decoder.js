const Web3 = require("web3")

// Decode parameters
let ans = Web3.eth.abi.decodeParameters(['uint256'],'0x00000000000000000000000000000000000000000000021f590bd840400fec90')

console.log(ans);
