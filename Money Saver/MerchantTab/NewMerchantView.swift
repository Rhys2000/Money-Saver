//
//  NewMerchantView.swift
//  Money Saver
//
//  Created by Rhys Julian-Jones on 1/18/24.
//

import SwiftUI

struct NewMerchantView: View {
    
    @Binding var isDisplayed: Bool
    @State private var textInput: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 5) {
                Text("Merchant Name")
                    .padding(.leading, 8)
                    .padding(.top, 16)
                    .font(.title3)
                    .bold()
                
                TextField("", text: $textInput)
                    .border(Color.orange)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(height: 100)
                Spacer()
            }
            .navigationBarTitle("Add a Merchant")
            .navigationBarItems(trailing: Button("Exit", action: {
                isDisplayed.toggle()
            }))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct NewMerchantView: View {
//    
//    @State private var tagSelected: Tag = .none
//    
//    var body: some View {
//        VStack {
//            
//            //Merchant Name Text Field
//            TextField("Add a Merchant...", text: $textInput)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            Picker("Choose a Tag:", selection: $tagSelected) {
//                ForEach(Tag.allCases, id: \.self) { tag in
//                    Text(tag.rawValue)
//                }
//            }
//            .pickerStyle(MenuPickerStyle())
//            .padding()
//            
//            Spacer()
//            
//            //Add Merchant Button
//            Button("Add Merchant") {
////                if(textInput.isEmpty) {
////                    isTextBad.toggle()
////                }
////                if(tagSelected == .none) {
////                    isTagBad.toggle()
////                }
//                addNewMerchant()
//            }
//            .foregroundColor(.white)
//            .frame(maxWidth: .infinity, minHeight: 50)
//            .background(.purple)
//            .cornerRadius(8)
//            .bold()
//            .font(.title3)
//            .padding()
//        }
//        .overlay(BackButton(closeSheet: $isDisplayed), alignment: .topTrailing)
////        .alert(isPresented: $isTextBad, content: {
////            Alert(title: Text("Error"), message: Text("You did not enter a name for this merchant"), dismissButton: .default(Text("I Understand")))
////        })
////        .alert(isPresented: $isTagBad, content: {
////            Alert(title: Text("Error"), message: Text("You did not select a tag for this merchant"), dismissButton: .default(Text("I Understand")))
////        })
//    }
//    
//    private func addNewMerchant() {
//        guard !textInput.isEmpty else { return }
//        guard !tagSelected.isEmpty else { return }
//        let newMerchant = Merchant(name: textInput, tag: tagSelected)
//        PersistenceManager.shared.saveMerchant(merchant: newMerchant)
//        textInput = ""
//        print("Merchant Added")
//    }
//}

#Preview {
    NewMerchantView(isDisplayed: .constant(false))
}
