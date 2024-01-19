//
//  MerchantListCell.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/19/24.
//

import SwiftUI

struct MerchantListCell: View {
    
    let currentMerchant: Merchant
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MerchantListCell(currentMerchant: Merchant(name: "Rhys", tag: "Homegoods"))
}
