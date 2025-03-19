module MyModule::
HealthRecords {

    use aptos_framework::signer;

    /// Struct representing a patient's health record.
    struct HealthRecord has key, store {
        data: vector<u8>,  // Encrypted health data
    }

    /// Function to store a health record.
    public fun store_health_record(owner: &signer, data: vector<u8>) {
        let record = HealthRecord { data };
        move_to(owner, record);
    }

    /// Function to retrieve a health record.
    public fun get_health_record(owner: address): vector<u8> acquires HealthRecord {
        let record = borrow_global<HealthRecord>(owner);
        record.data
    }
}
