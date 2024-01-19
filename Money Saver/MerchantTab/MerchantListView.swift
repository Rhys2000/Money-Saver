//
//  MerchantListView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct MerchantListView: View {
    
    @State private var addingNewMerchant = false
    @State private var merchants: [Merchant] = []
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                // List of Merchants
                List {
                    //Turns each Merchant in the saved data into a row in the List
                    ForEach(merchants, id: \.name) { merchant in
                        MerchantListCell(currentMerchant: merchant)
                            .listRowInsets(EdgeInsets())
                    }
                    .onDelete(perform: deleteMerchant)
                }
                .onAppear {
                    merchants = PersistenceManager.shared.loadMerchants()
                }
                .id(addingNewMerchant)
                .sheet(isPresented: $addingNewMerchant) {
                    NewMerchantView(isDisplayed: $addingNewMerchant)
                }
                
                Spacer()
            }
            .navigationBarTitle("Merchant List")
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing: AddButton(openSheet: $addingNewMerchant))
        }
    }
    
    func deleteMerchant(at offsets: IndexSet) {
        merchants.remove(atOffsets: offsets)
        PersistenceManager.shared.saveMerchants(merchants: merchants)
    }
}

struct Merchant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var tag: String
}
