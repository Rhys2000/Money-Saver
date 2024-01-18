//
//  MerchantListView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct MerchantListView: View {
    
    @State private var isNewMerchant = false
    @State private var merchants: [Merchant] = []

    var body: some View {
        VStack {
            
            //Header Bar
            HeaderBar(title: "Merchant List", view: NewMerchantView(isDisplayed: $isNewMerchant), addNewItem: $isNewMerchant)
            
            //List of Merchants
            List {
                ForEach(merchants, id: \.name) { merchant in
                    Text(merchant.name + " -> " + merchant.tag)
                }
            }
            .onAppear {
                merchants = PersistenceManager.shared.loadMerchants()
            }
            .id(isNewMerchant)
            
            Spacer()
        }
    }
}

struct Merchant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var tag: String
}
