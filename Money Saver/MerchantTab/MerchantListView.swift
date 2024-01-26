//  MerchantListView.swift
//  Money Saver
//  Created by Rhys Julian-Jones on 1/18/24.

import SwiftUI

struct MerchantListView: View {
    
    @State private var merchants: [Merchant] = PersistenceManager.shared.loadMerchants()
    @State private var newMerchant = false
    
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
            .navigationBarItems(trailing: AddButton(openSheet: $newMerchant))
            .navigationBarItems(trailing: Button("Hi", action: sayHello))
            .sheet(isPresented: $newMerchant) {
                NewMerchantView(isDisplayed: $newMerchant)
            }
            .onChange(of: newMerchant) {
                merchants = PersistenceManager.shared.loadMerchants()
            }
        }
    }
    
    private func deleteMerchant(at offsets: IndexSet) {
        merchants.remove(atOffsets: offsets)
    }
}

struct ExpandingMerchantCell: View {
    
    let currentMerchant: Merchant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                
                //Merchant Name Constructor
                Text(currentMerchant.name)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                //Merchant Tag Constructor
                Text(currentMerchant.tag.rawValue)
                    .font(.headline)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(RoundedRectangle(cornerRadius: 10).fill(currentMerchant.tag.color))
                
                //Chavron Image Constructor
                Image(systemName: currentMerchant.isExpanded ? "chevron.up" : "chevron.down")
                    .bold()
            }
            if currentMerchant.isExpanded {
                RoundedRectangle(cornerRadius: 1)
                    .frame(height: 2)
                    .padding(.top, 4)
                Text("Number of Transactions:")
                    .padding(.top, 8)
                Text("Total Amount Spent:")
                    .padding(.top, 8)
            }
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    MerchantListView()
}
