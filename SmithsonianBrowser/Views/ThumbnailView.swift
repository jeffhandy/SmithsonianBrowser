//
//  ThumbnailView.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/13/21.
//

import SwiftUI

struct ThumbnailView: View {
    
    @ObservedObject var recordViewModel: RecordViewModel
    var color: Color
    
    var body: some View {
        
        VStack {
            
            Text("Title:").font(.system(size: 14))
                .bold().frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            
            NavigationLink(destination: DetailView(recordViewModel: recordViewModel)) {
                Text("\(recordViewModel.item.title)")
                    .frame(maxWidth: 200, alignment: .leading)
                    .font(.system(size: 14))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .lineLimit(4)
            }
            
            Text("Source:").font(.system(size: 14))
                .bold().frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            
            Text("\(recordViewModel.item.dataSource)")
                .frame(maxWidth: 200, alignment: .leading)
                .font(.system(size: 14))
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                .lineLimit(4)
            
            Spacer()
            
            if recordViewModel.imageIsLoaded {
                if let image = recordViewModel.image {
                    
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                }
            } else {
                ProgressView().scaleEffect(CGSize(width: 2.0, height: 2.0))
            }
            Spacer()
        }
        .frame(width: 250, height: 400)
        .background(color.opacity(0.8))
        .fixedSize(horizontal: false, vertical: true)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 5)
        )
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}
