//
//  BackButton.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

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

#Preview {
    BackButton(closeSheet: .constant(false))
}
