//
//  SearchBar.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/12/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State private var isEditing = false
    var category: Int
    var resultsViewModel: ResultsViewModel
    
    var body: some View {
        HStack {
            
            TextField("Search ...", text: $text,
                      onEditingChanged: { (isBegin) in
                        if isBegin {
                            resultsViewModel.nextButtonDisabled = true
                            resultsViewModel.previousButtonDisabled = true
                        } 
                      },
                      onCommit: {
                        resultsViewModel.startRecord = 0
                        resultsViewModel.fetchCategoryData(query: text, category: category, start: resultsViewModel.startRecord)
                        //a new query disables previous button, startRecord is at 0
                        resultsViewModel.previousButtonDisabled = true
                      })
                .keyboardType(.webSearch)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                resultsViewModel.nextButtonDisabled = true
                                resultsViewModel.previousButtonDisabled = true
                                resultsViewModel.startRecord = 0
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    resultsViewModel.previousButtonDisabled = true
                    resultsViewModel.nextButtonDisabled = true
                    resultsViewModel.startRecord = 0
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}



