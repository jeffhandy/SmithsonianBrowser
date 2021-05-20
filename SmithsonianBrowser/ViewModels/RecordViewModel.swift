//
//  RecordViewModel.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/15/21.
//

import Foundation
import UIKit


class RecordViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var imageIsLoaded: Bool = false
    
    let item: ItemRecordModel
    
    init(item: ItemRecordModel) {
        self.item = item
        self.fetchImage(for: item, completion: { (record, result) -> () in
            var itemCopy = item
            let image = try? result.get()
            if let image = image {
                itemCopy.image = image
                DispatchQueue.main.async {
                    self.imageIsLoaded = true
                    self.image = image
                }
            }
        })
    }
    
    private func fetchImage(for record: ItemRecordModel, completion: @escaping (ItemRecordModel, Result<UIImage?, Error>) -> Void) {
        
        guard let urlString = record.imageUrl else {
            let result: Result<UIImage?, Error>
            let image = UIImage(named: "noimage")
            result = .success(image)
            self.imageIsLoaded = true
            completion(record, result)
            
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            let result: Result<UIImage?, Error>
            if let url = URL(string: urlString),
                let image = (try? Data(contentsOf: url)).flatMap({ UIImage(data: $0) }) {
                result = .success(image)
            } else {
                result = .failure(RecordError.runtimeError(message:"Could not get image for record: \(record.id)"))
            }
            completion(record, result)
        }
    }
}


