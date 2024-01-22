//  MerchantListView.swift
//  Money Saver
//  Created by Rhys Julian-Jones on 1/18/24.

import SwiftUI

struct MerchantListView: View {
    
    //@State private var merchants: [Merchant] = PersistenceManager.shared.loadMerchants()
    @State private var merchants = [Merchant(name: "Rhys", tag: .groceries), Merchant(name: "Trader", tag: .homegoods)]
    
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
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    private func deleteMerchant(at offsets: IndexSet) {
        merchants.remove(atOffsets: offsets)
    }
}

#Preview {
    MerchantListView()
}
