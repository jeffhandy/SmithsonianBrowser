//
//  CategoryResultsModel.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/13/21.
//

import Foundation

struct CategoryDocumentModel: Decodable {
    var response : CategoryResultsModel
}

struct CategoryResultsModel: Decodable {
    let rows : [ItemRecordModel]
}



