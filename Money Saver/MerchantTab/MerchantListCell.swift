//
//  MerchantListCell.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/19/24.
//

import SwiftUI

struct MerchantListCell: View {
    
    @State private var showMoreInfo = false
    
    let currentMerchant: Merchant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                // Name text object
                Text(currentMerchant.name)
                    .padding(.leading, 10)
                    .foregroundColor(.white)
                    .bold()
                
                Spacer()
                
                // Tag text object
                Text(currentMerchant.tag.rawValue)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(currentMerchant.tag.color)
                    )
                    .bold()
                
                // Chevron image object
                Image(systemName: showMoreInfo ? "chevron.down" : "chevron.left")
                    .padding(.trailing, 10)
                    .bold()
                    .foregroundColor(Color.white)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showMoreInfo.toggle()
                        }
                    }
            }
            .padding(8)
            
            if showMoreInfo {
                Rectangle()
                    .frame(width: .infinity, height: 1)
                    .background(Color.black)
                    .opacity(0.2)
                    .padding(.vertical, -8)
                
                Text("Number of Transactions:")
                    .padding(.leading, 18)
                    .padding(.top, -6)
                    .foregroundColor(.white)
                    .bold()
                
                Text("Total Amount Spent:")
                    .padding(.leading, 18)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 8)
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
        )
        .padding(.vertical, -12)
    }
}

#Preview {
    MerchantListCell(currentMerchant: Merchant(name: "Rhys", tag: .homegoods))
}
