//
//  NewMerchantView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct NewMerchantView: View {
    
    @State private var textInput = ""
    @State private var isTextBad = false
    @State private var tagSelected: Tag = .none
    @State private var isTagBad = false
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
            
            Picker("Choose a Tag:", selection: $tagSelected) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            Spacer()
            
            //Add Merchant Button
            Button("Add Merchant") {
                addNewMerchant()
                if(textInput.isEmpty) {
                    isTextBad.toggle()
                }
                if(tagSelected.isEmpty) {
                    isTagBad.toggle()
                }
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
        .alert(isPresented: $isTextBad, content: {
            Alert(title: Text("Error"), message: Text("You did not enter a name for this merchant"), dismissButton: .default(Text("I Understand")))
        })
        .alert(isPresented: $isTagBad, content: {
            Alert(title: Text("Error"), message: Text("You did not select a tag for this merchant"), dismissButton: .default(Text("I Understand")))
        })
    }
    
    private func addNewMerchant() {
        guard !textInput.isEmpty else { return }
        guard !tagSelected.isEmpty else { return }
        let newMerchant = Merchant(name: textInput, tag: tagSelected)
        PersistenceManager.shared.saveMerchant(merchant: newMerchant)
        textInput = ""
        print("Merchant Added")
    }
}

#Preview {
    NewMerchantView(isDisplayed: .constant(false))
}
