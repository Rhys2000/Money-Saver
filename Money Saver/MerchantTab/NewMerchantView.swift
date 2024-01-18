//
//  NewMerchantView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct NewMerchantView: View {
    
    @Binding var isDisplayed: Bool
    
    var body: some View {
        VStack {
            
            //Title Text
            Text("Add a New Merchant")
                .font(.title3)
                .bold()
                .padding(.top)
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 2)
                .opacity(0.4)
                
            
            Spacer()
            
            //Add Transaction Button
            Button("Add Merchant") {
                //isDisplayed.toggle()
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(.purple)
            .cornerRadius(8)
            .bold()
            .font(.title3)
            .padding()
        }
        .overlay(BackButton(closeSheet: $isDisplayed), alignment: .topTrailing)
    }
}

#Preview {
    NewMerchantView(isDisplayed: .constant(false))
}
