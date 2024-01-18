//
//  TransactionListView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct TransactionListView: View {

    @State private var isNewTransaction = false
    
    var body: some View {
        VStack {
            //Header Bar
            HeaderBar(title: "Transaction List", view: NewTransactionView(isDisplayed: $isNewTransaction), addNewItem: $isNewTransaction)
            Spacer()
        }
    }
}

