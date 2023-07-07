from brownie import accounts, SalesManagement, config
import time

def main():
    from_account = accounts.add(config['wallets']['from_key'])
    owner_account = accounts.add(config['wallets']['owner_key'])
    employee_account = accounts.add(config['wallets']['employee_key'])

    contract_address = SalesManagement.deploy(owner_account, employee_account, {'from':from_account})

    time.sleep(1)