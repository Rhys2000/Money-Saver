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
            
            //Name text object
            Text(currentMerchant.name)
                .padding(.leading, 10)
                .foregroundColor(.white)
                .bold()
            
            Spacer()
            
            //Tag text object
            Text(currentMerchant.tag.rawValue)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                )
                .bold()
                .padding(.trailing, 10)
            
            //Image(systemName: "")
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
                .frame(height: 50)
        )
    }
}

#Preview {
    MerchantListCell(currentMerchant: Merchant(name: "Rhys", tag: .homegoods))
}
