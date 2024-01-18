//
//  NewTransactionView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct NewTransactionView: View {
    
    @Binding var isDisplayed: Bool
    
    var body: some View {
        VStack {
            
            //Title Text
            Text("Create a New Transaction")
                .font(.title3)
                .bold()
                .padding(.top)
            
            Rectangle()
                .fill(Color.black)
                .frame(height: 2)
                .opacity(0.4)
            
            Text("Select Merchant:")
            Text("Enter Price:")
            Text("Add Date:")
                
            
            Spacer()
            
            //Add Transaction Button
            Button("Add Transaction") {
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
    NewTransactionView(isDisplayed: .constant(false))
}
