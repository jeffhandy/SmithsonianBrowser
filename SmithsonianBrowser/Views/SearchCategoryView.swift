//
//  SearchCategoryView.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/12/21.
//

import SwiftUI

struct SearchCategoryView: View {
    
    private var categories = ["Art & Design", "History & Culture", "Science & Tech"]
    
    @ObservedObject var resultsViewModel: ResultsViewModel
    @State private var searchText = ""
    @State private var selectedCategory = 2
    @State private var start = 0
    @State private var nextButtonDisabled = true
    @State private var previousButtonDisabled = true
    
    init(resultsViewModel: ResultsViewModel ) {
        //the table has to be clear in order for our tiled background to show through
         UITableView.appearance().backgroundColor = .clear
         self.resultsViewModel = resultsViewModel
     }
    
    var body: some View {
        
        VStack {
            
            SearchBar(text: $searchText, category: selectedCategory, resultsViewModel: resultsViewModel)
                .padding(EdgeInsets(top: 10, leading: 25, bottom: 2, trailing: 25))
            
            Picker("Categories", selection: $selectedCategory) {
                ForEach(0 ..< categories.count) {
                    Text(self.categories[$0])
                }
            }
            .onChange(of: selectedCategory) { newValue in
                //change API param back to 0 when new category selected
                resultsViewModel.startRecord = 0
                resultsViewModel.previousButtonDisabled = true
                resultsViewModel.nextButtonDisabled = true
                if searchText != "" {
                    resultsViewModel.fetchCategoryData(query: searchText, category: selectedCategory, start: resultsViewModel.startRecord)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(EdgeInsets(top: 2, leading: 35, bottom: 10, trailing: 35))
            //.frame(width: .infinity)
            
            HStack {
                
                Button(action: {
                    
                    if start >= maxRecordsToReturn {
                        start -= maxRecordsToReturn
                        start = start < 0 ? 0 : start
                        self.resultsViewModel.fetchCategoryData(query: searchText, category: selectedCategory, start: start)
                    }
                    if start < maxRecordsToReturn {
                        resultsViewModel.previousButtonDisabled = true
                    }
                    
                    resultsViewModel.startRecord = start
                    
                }) {
                    HStack {
                        Text("Previous")
                    }.padding(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                }.disabled(resultsViewModel.previousButtonDisabled)
                
                Spacer()
                
                Button(action: {
                    resultsViewModel.previousButtonDisabled = false
                    start += 20
                    self.resultsViewModel.fetchCategoryData(query: searchText, category: selectedCategory, start: start)
                    resultsViewModel.startRecord = start
                }) {
                    HStack {
                        Text("   Next   ")
                    }.padding(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                }.disabled(resultsViewModel.nextButtonDisabled)
                
            }.padding(EdgeInsets(top: 2, leading: 35, bottom: 0, trailing: 35))
            //Spacer()
            
        }.frame(alignment: .top)
    }
}
