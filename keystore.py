from web3 import Web3
import json

# Connect to a local or remote Ethereum node
web3 = Web3(Web3.HTTPProvider('http://localhost:8545'))  # Update with your Ethereum node URL

# Generate a new Ethereum account
# accounts = web3.eth.account.create()

privateKey = '0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80'

# Encrypt the private key using web3.py
keystore = web3.eth.account.encrypt(privateKey, 'adil1234')  # Replace 'your_password' with your chosen password

# Save the keystore JSON to a file
with open('keystore.json', 'w') as f:
    json.dump(keystore, f)

print("Keystore generated and saved to keystore.json.")

