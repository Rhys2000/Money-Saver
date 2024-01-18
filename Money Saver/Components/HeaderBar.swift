//
//  HeaderBar.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct HeaderBar<Content: View>: View {
    
    var title: String
    var view: Content
    @Binding var addNewItem: Bool
    
    var body: some View {
        
        HStack {
            //Edit Button
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit")
                    .bold()
            })
            .padding([.horizontal, .top])
            
            Spacer()
            
            //Title
            Text(title)
                .bold()
                .font(.largeTitle)
                .padding(.top)
            
            Spacer()
            
            //Add Transaction Button
            Button(action: {
                addNewItem.toggle()
            }, label: {
                Image(systemName: "plus")
                    .bold()
            })
            .padding([.horizontal, .top])
            .sheet(isPresented: $addNewItem) {
                view
            }
        }
    }
}

#Preview {
    HeaderBar(title: "Header", view: NewTransactionView(isDisplayed: .constant(false)), addNewItem: .constant(false))
}
