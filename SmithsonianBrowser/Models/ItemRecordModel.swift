//
//  ItemRecordModel.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/15/21.
//

import Foundation
import UIKit

struct ItemResponse: Decodable {
    var response: ItemRecordModel
}

struct ItemRecordModel {
    
    let id: String
    let title: String
    let unitCode: String
    let type: String
    let url: String
    let dataSource: String
    let imageUrl: String?
    var image: UIImage?
    //let notes: String / content -> freeText -> notes []

}



extension ItemRecordModel: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case response
        case id
        case title
        case unitCode
        case type
        case url
        case imageUrl = "thumbnail"
        case content
        
        enum ContentKeys: String, CodingKey {
            case descriptive = "descriptiveNonRepeating"
        }
        
        enum OnlineMediaKeys: String, CodingKey {
            case onlineMedia = "online_media"
            case dataSource = "data_source"
        }
        
        enum MediaKeys: String, CodingKey {
            case media = "media"
        }
        
        enum ThumbnailKeys: String, CodingKey {
            case thumbnail = "thumbnail"
        }
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        unitCode = try container.decode(String.self, forKey: .unitCode)
        type = try container.decode(String.self, forKey: .type)
        url = try container.decode(String.self, forKey: .url)
        
       
        let contentContainer = try container.nestedContainer(keyedBy: CodingKeys.ContentKeys.self, forKey: .content)
        let descContainer = try contentContainer.nestedContainer(keyedBy: CodingKeys.OnlineMediaKeys.self, forKey: .descriptive)
        dataSource = try descContainer.decode(String.self, forKey: .dataSource)
        
        if descContainer.contains(CodingKeys.OnlineMediaKeys.onlineMedia) {
        
            let onlineContainer = try descContainer.nestedContainer(keyedBy: CodingKeys.MediaKeys.self, forKey: .onlineMedia)
            var mediaContainer = try onlineContainer.nestedUnkeyedContainer(forKey: .media)
            
            let thumbnailContainer = try mediaContainer.nestedContainer(keyedBy: CodingKeys.ThumbnailKeys.self)
            imageUrl = try thumbnailContainer.decodeIfPresent(String.self, forKey: .thumbnail) ?? ""
            
        } else {
            imageUrl = nil
        }
        
    }
}
