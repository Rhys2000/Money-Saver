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
        HStack {
            Text(currentMerchant.name)
                .padding(.leading, 10)
                .foregroundColor(.white)
                .bold()
            Spacer()
            Text(currentMerchant.tag)
                .padding(.trailing, 10)
                .foregroundColor(.white)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue) // Change the color as per your design
                .frame(height: 50)
        )
    }
}

#Preview {
    MerchantListCell(currentMerchant: Merchant(name: "Rhys", tag: "Homegoods"))
}
