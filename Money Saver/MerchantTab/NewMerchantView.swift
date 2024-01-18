//
//  NewMerchantView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct NewMerchantView: View {
    
    @State private var textInput = ""
    @Binding var isDisplayed: Bool
    
    var body: some View {
        VStack {
            
            //Title Text
            Text("Add a New Merchant")
                .font(.title3)
                .bold()
                .padding(.top)
            
            //Divider
            Rectangle()
                .fill(Color.black)
                .frame(height: 2)
                .opacity(0.4)
            
            //Merchant Name Text Field
            TextField("Add a Merchant...", text: $textInput)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            //Add Merchant Button
            Button("Add Merchant") {
                addNewMerchant()
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
    
    private func addNewMerchant() {
        guard !textInput.isEmpty else { return }
        let newMerchant = Merchant(name: textInput)
        PersistenceManager.shared.saveMerchant(merchant: newMerchant)
        textInput = ""
        print("Merchant Added")
    }
}

#Preview {
    NewMerchantView(isDisplayed: .constant(false))
}
