//
//  ContentView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isNewTransactionPagePresented = false
    
    var body: some View {
        
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
                NewTransactionView()
            }
            
        }
//        .background(.green)
        Spacer()
    }
}

struct NewTransactionView: View {
    var body: some View {
        Text("Hello")
    }
}

#Preview {
    ContentView()
}
