module MyModule::FreelancerPayment {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a payment contract.
    struct PaymentContract has store, key {
        client: address,
        freelancer: address,
        amount: u64,
        is_completed: bool,
    }

    /// Function to create a new payment contract between client and freelancer.
    public fun create_contract(client: &signer, freelancer: address, amount: u64) {
        let contract = PaymentContract {
            client: signer::address_of(client),
            freelancer,
            amount,
            is_completed: false,
        };
        move_to(client, contract);
    }
}