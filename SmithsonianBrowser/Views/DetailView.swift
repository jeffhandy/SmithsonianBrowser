//
//  DetailView.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/19/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var recordViewModel: RecordViewModel
    
    var body: some View {
        
        VStack {
            
            Text("Title:").font(.system(size: 14))
                .bold().frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Text("\(recordViewModel.item.title)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14))
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Text("Source:").font(.system(size: 14))
                .bold().frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Text("\(recordViewModel.item.dataSource)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14))
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
            
            if recordViewModel.imageIsLoaded {
                if let image = recordViewModel.image {
                    
                    Image(uiImage: image).resizable()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 400, alignment: .bottom)
                }
            } else {
                ProgressView().scaleEffect(CGSize(width: 2.0, height: 2.0))
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.8))
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

