//  MerchantListView.swift
//  Money Saver
//  Created by Rhys Julian-Jones on 1/18/24.

import SwiftUI

struct MerchantListView: View {
    
    //@State private var merchants: [Merchant] = PersistenceManager.shared.loadMerchants()
    @State private var merchants = [Merchant(name: "Trader Joe's", tag: .groceries), Merchant(name: "Target", tag: .homegoods)]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(merchants.indices, id: \.self) { index in
                        Button(action: {
                            withAnimation {
                                self.merchants[index].isExpanded.toggle()
                            }
                        }) {
                            ExpandingMerchantCell(currentMerchant: merchants[index])
                        }
                    }
                    .onDelete(perform: deleteMerchant)
                    .listRowSeparator(.hidden)
                    .padding(.vertical, -4)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, -8)
            }
            .navigationBarTitle("Merchants")
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing: AddButton(openSheet: .constant(false)))
        }
    }
    
    private func deleteMerchant(at offsets: IndexSet) {
        merchants.remove(atOffsets: offsets)
    }
}

struct ExpandingMerchantCell: View {
    
    let currentMerchant: Merchant
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                //Merchant Name Constructor
                Text(currentMerchant.name)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                //Merchant Tag Constructor
                Text(currentMerchant.tag.rawValue)
                    .font(.headline)
                    .background(currentMerchant.tag.color)
                
                //Chavron Image Constructor
                Image(systemName: currentMerchant.isExpanded ? "chevron.up" : "chevron.down")
                    .background(Color.blue)
            }
            if currentMerchant.isExpanded {
                Text("Number of Transactions:")
                Text("Total Amount Spent:")
            }
        }
    }
}

#Preview {
    MerchantListView()
}
