//
//  AddButton.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/19/24.
//

import SwiftUI

struct AddButton: View {
    
    @Binding var openSheet: Bool
    
    var body: some View {
        Button(action: {
            openSheet.toggle()
        }, label: {
            Image(systemName: "plus")
        })
    }
}

#Preview {
    AddButton(openSheet: .constant(false))
}
