//
//  TransactionListView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct TransactionListView: View {

    @State private var isNewTransactionPagePresented = false
    
    var body: some View {
        VStack {
            //Header Bar
            HStack {
                //Edit Button
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Edit")
                        .bold()
                })
                .padding([.horizontal, .top])
                
                //Title
                Text("Transaction List")
                    .bold()
                    .font(.largeTitle)
                    .padding(.top)
                
                //Add Transaction Button
                Button(action: {
                    isNewTransactionPagePresented.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .bold()
                })
                .padding([.horizontal, .top])
                .sheet(isPresented: $isNewTransactionPagePresented) {
                    NewTransactionView(isDisplayed: $isNewTransactionPagePresented)
                }
            }
            Spacer()
        }
    }
}

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

struct BackButton: View {
    @Binding var closeSheet: Bool
    
    var body: some View {
        Button {
            closeSheet.toggle()
        } label: {
            Image(systemName: "x.circle")
                .padding(.top, 15)
                .padding(.trailing, 20)
                .scaleEffect(1.5)
        }
    }
}
