//
//  ContentView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit")
                    .bold()
            })
            .padding(.horizontal)
            .padding(.top)
            Text("Transaction List")
                .bold()
                .font(.largeTitle)
                .padding(.top)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "plus")
                    .bold()
            })
            .padding(.horizontal)
            .padding(.top)
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
