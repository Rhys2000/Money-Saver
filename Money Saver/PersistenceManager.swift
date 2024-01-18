//
//  PersistenceManager.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import Foundation

class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    private let merchantEntriesKey = "MEK"
    private let transactionEntriesKey = "TEK"
    
    func saveMerchant(merchant: Merchant) {
        var savedMerchants = loadMerchants()
        savedMerchants.append(merchant)
        saveMerchants(merchants: savedMerchants)
    }
    
    func loadMerchants() -> [Merchant] {
        if let data = UserDefaults.standard.data(forKey: merchantEntriesKey),
           let merchants = try? JSONDecoder().decode([Merchant].self, from: data) {
            return merchants
        }
        return []
    }
    
    private func saveMerchants(merchants: [Merchant]) {
        if let data = try? JSONEncoder().encode(merchants) {
            UserDefaults.standard.set(data, forKey: merchantEntriesKey)
        }
    }
}
