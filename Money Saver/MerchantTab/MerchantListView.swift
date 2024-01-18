//
//  MerchantListView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct MerchantListView: View {
    
    @State private var isNewMerchant = false

    var body: some View {
        VStack {
            //Header Bar
            HeaderBar(title: "Merchant List", view: NewMerchantView(), addNewItem: $isNewMerchant)
            Spacer()
        }
    }

}
