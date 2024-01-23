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
    @State private var tagInput: Tag = .none
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 5) {
                Text("Merchant Name")
                    .padding(.leading, 16)
                    .padding(.top, 16)
                    .font(.title3)
                    .bold()
                
                TextField("Name", text: $textInput)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 16)
                
                HStack(alignment: .bottom) {
                    Text("Select a Category")
                        .padding(.leading, 16)
                        .padding(.top, 16)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    if(tagInput != .none) {
                        Text(tagInput.rawValue)
                            .padding(.trailing, 16)
                            .font(.headline)
                            .foregroundColor(.mint)
                    }
                }
                
                List {
                    ForEach(Tag.allCases.dropFirst(), id: \.self) { tag in
                        Text(tag.rawValue)
                    }
                }
                .listStyle(.plain)
                .frame(height: 200)
                
                Text("Add an Image")
                    .padding(.leading, 16)
                    .padding(.top, 16)
                    .font(.title3)
                    .bold()
                
                Spacer()
            }
            .navigationBarTitle("New Merchant")
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
