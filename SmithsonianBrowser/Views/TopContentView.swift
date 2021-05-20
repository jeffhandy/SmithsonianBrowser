//
//  TopContentView.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/12/21.
//

import SwiftUI

struct TopContentView: View {
    
    @State var text: String = ""
    @State var selectedCategory = 0
    @ObservedObject var resultsViewModel = ResultsViewModel()
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { _ in
                
                VStack {
                    
                    SearchCategoryView(resultsViewModel: resultsViewModel)
                        .navigationBarTitle("Smithsonian Collection", displayMode: .inline)
                        .alert(isPresented: $resultsViewModel.showErrorAlert) {
                            Alert(title: Text("Error"),
                                  message: Text(resultsViewModel.errorThrownMessage ?? "unknown error"),
                                  dismissButton: .default(Text("Ok")))
                        }
                    
                    if resultsViewModel.items.count == 0  && resultsViewModel.queryInProgress == true && resultsViewModel.errorThrownMessage == nil {
                        
                        ProgressView().scaleEffect(CGSize(width: 3.0, height: 3.0))
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 350, trailing: 0))
                    }
                    
                    if resultsViewModel.items.count == 0 && resultsViewModel.queryInProgress == false  && resultsViewModel.firstQueryFinished == true {
                        
                       
                        
                        Text("No Results for query.").font(.system(size: 24)).italic()
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 350, trailing: 0))
                        
                       
                    }
                    
                    Spacer()
                    
                    if resultsViewModel.firstQueryFinished == false && resultsViewModel.queryInProgress == false {
                        DefaultRecordView()
                        Spacer()
                    } else {
                        
                        if resultsViewModel.items.count > 0 {
                            Text("Records \(resultsViewModel.startRecord + 1) to \(resultsViewModel.startRecord + resultsViewModel.items.count)  ")
                                .font(.system(size: 14))
                                .italic()
                            Spacer()
                        }
                        
                        ScrollView(.horizontal) {
                            Section {
                                HStack {
                                    ForEach((0..<resultsViewModel.items.count), id: \.self) { num in
                                        let item = resultsViewModel.items[num]
                                        let recordViewModel = RecordViewModel(item: item)
                                        ThumbnailView(recordViewModel: recordViewModel, color: Color.white)
                                    }
                                    
                                } .padding(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                            }
                        }
                    }
                    Spacer()
                }.ignoresSafeArea(.keyboard)
                
                
            }.background(
                Image("background-tile")
                    .resizable(resizingMode: .tile).opacity(0.25)
                    .scaledToFill()).ignoresSafeArea(.keyboard)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TestContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            
            TopContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
