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
    @State private var badInput = false
    
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
                        Button(action: {
                            tagInput = tag
                        }) {
                            HStack {
                                Text(tag.rawValue)
                                Spacer()
                                if tagInput == tag {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .frame(height: 100)
                
                Text("Add an Image")
                    .padding(.leading, 16)
                    .padding(.top, 16)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                Button("Add Merchant") {
                    guard !textInput.isEmpty else {
                        badInput.toggle()
                        return
                    }
                    guard !tagInput.isEmpty else {
                        badInput.toggle()
                        return
                    }
                    addNewMerchant()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.purple)
                .cornerRadius(10)
                .font(.title3)
                .bold()
                .padding(.horizontal, 16)
                .padding(.vertical, 1)
            }
            .navigationBarTitle("New Merchant")
            .navigationBarItems(trailing: Button("Exit", action: {
                isDisplayed.toggle()
            }))
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $badInput, content: {
                Alert(title: Text("Bad Input"), message: Text("Please enter a name and select a category"), dismissButton: .default(Text("Dismiss")))
            })
        }
    }
    
    private func addNewMerchant() {
        let newMerchant = Merchant(name: textInput, tag: tagInput)
        PersistenceManager.shared.saveMerchant(merchant: newMerchant)
        textInput = ""
    }
}

//struct NewMerchantView: View {
//    
//    var body: some View {
//        VStack {
//            
//            //Add Merchant Button
//            Button("Add Merchant") {
//                addNewMerchant()
//            }
//        }
//    }
//    
//    private func addNewMerchant() {
//        let newMerchant = Merchant(name: textInput, tag: tagSelected)
//        PersistenceManager.shared.saveMerchant(merchant: newMerchant)
//        textInput = ""
//        print("Merchant Added")
//    }
//}

#Preview {
    NewMerchantView(isDisplayed: .constant(false))
}
