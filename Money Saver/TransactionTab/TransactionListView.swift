//
//  TransactionListView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct TransactionListView: View {

    @State private var addingNewTransaction = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
            }
            .navigationBarTitle("Transaction List")
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing: AddButton(openSheet: $addingNewTransaction))
        }
    }
}

