//
//  ContentView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            TransactionListView()
            .tabItem { Label("Transactions", systemImage: "dollarsign.square") }
            MerchantListView()
            .tabItem { Label("Merchants", systemImage: "storefront") }
        }
    }
}

#Preview {
    ContentView()
}
