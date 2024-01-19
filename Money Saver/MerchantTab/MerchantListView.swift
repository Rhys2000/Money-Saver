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
        NavigationView {
            VStack {
                
                // List of Merchants
                List {
                    //Turns each Merchant in the saved data into a row in the List
                    ForEach(merchants, id: \.name) { merchant in
                        Text(merchant.name + " -> " + merchant.tag)
                    }
                    .onDelete(perform: deleteMerchant)
                }
                .onAppear {
                    merchants = PersistenceManager.shared.loadMerchants()
                }
                .id(isNewMerchant)
                .sheet(isPresented: $isNewMerchant) {
                    NewMerchantView(isDisplayed: $isNewMerchant)
                }
                
                Spacer()
            }
            .navigationBarTitle("Merchant List")
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing: AddButton(openSheet: $isNewMerchant))
        }
    }
}

struct Merchant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var tag: String
}
