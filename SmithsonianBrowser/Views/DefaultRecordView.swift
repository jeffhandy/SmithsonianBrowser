//
//  DefaultRecordView.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/19/21.
//

import SwiftUI

struct DefaultRecordView: View {
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Enter a search term and select a category (e.g.\"Art & History\") to specify your query on the Smithsonian database.")
                .font(.system(size: 22))
                .foregroundColor(.gray)
                .bold()
                //.frame(maxHeight: 400, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 20))
                .lineLimit(nil)
            
            Spacer()
            
            Image("smithsonian-logo").resizable()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 200, maxHeight: 200, alignment: .center)
            
            Spacer()
            
        }
        .frame(width: 350, height: 400)
        .background(Color.white.opacity(0.5))
        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 5)
        )
    }
}

struct DefaultRecordView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultRecordView()
    }
}
