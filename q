import requests  
import random  

# Generate a random 44-character Solana address (basic example, not cryptographically secure)  
def generate_address():  
    return ''.join(random.choices('1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', k=44))  

# Check balance on Solscan (simplified API call)  
def check_balance(addr):  
    url = f"https://api.solscan.io/address/{addr}"  
    response = requests.get(url)  
    data = response.json()  
    return data.get('result', {}).get('balance', 0)  

# Run the scanner indefinitely until a balance is found  
while True:  
    address = generate_address()  
    balance = check_balance(address)  
    if balance > 0:  
        print(f"🔥 Found a wallet with {balance} SOL at address: {address}")  
        break  
