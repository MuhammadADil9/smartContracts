const { Web3 } = require('web3')

// Replace with your provider URL (e.g., Infura, Alchemy)
const providerUrl = 'http://127.0.0.1:8545';
const web3 = new Web3(providerUrl);

// Replace with your contract address
const contractAddress = '0xbdEd0D2bf404bdcBa897a74E6657f1f12e5C6fb6';

// Define the ABI for your contract
const abi = [
  // Your contract ABI here, including the Transaction event definition
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "sender",
        "type": "address"
      },
      {
        "internalType": "uint256",
        "name": "amount",
        "type": "uint256"
      },
      {
        "internalType": "string",
        "name": "name",
        "type": "string"
      }
    ],
    "name": "Transaction",
    "type": "event"
  }
  // ... other events and functions
];

// Create a contract instance
const contract = new web3.eth.Contract(abi, contractAddress);

// Define filter options (optional)
const fromBlock = 0; // Starting block number (default: latest block)
const toBlock = 'latest'; // Ending block number (default: latest block)

// Filter and subscribe to events
const filter = contract.events.Transaction({}, { fromBlock, toBlock });

filter.on('data', (event) => {
  console.log('--- New Transaction Event ---');
  console.log('Sender:', event.args.sender);
  console.log('Amount:', event.args.amount.toString());
  console.log('Name:', event.args.name);
});

// Alternatively, get all past events at once (less efficient for ongoing monitoring)
filter.getPastEvents((error, events) => {
  if (error) console.error(error);
  else {
    events.forEach((event) => {
      console.log('--- Past Transaction Event ---');
      console.log('Sender:', event.args.sender);
      console.log('Amount:', event.args.amount.toString());
      console.log('Name:', event.args.name);
    });
  }
});
