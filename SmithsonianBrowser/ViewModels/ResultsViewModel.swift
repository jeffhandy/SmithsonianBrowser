//
//  ResultsViewModel.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/15/21.
//

import Foundation
import UIKit

enum RecordError: Error {
    case runtimeError(message: String)
    case requestFailure(url: String, message: String)
    case serializationFailure(url: String, message: String)
}

enum SearchError: Error {
    case invalidUrl
    case invalidSearchTerm
    case otherSearchError(text: String)
    case networkError(text: String)
    case invalidHttpResponse
    case badHttpCode(code: String)
    case noDataReceived
    case jsonParsingError
}

let searchCategories = ["art_design", "history_culture", "science_technology"]


class ResultsViewModel: ObservableObject {
    @Published var items: [ItemRecordModel] = []
    @Published var queryInProgress = false
    @Published var firstQueryFinished = false
    @Published var startRecord = 0
    @Published var nextButtonDisabled = true
    @Published var previousButtonDisabled = true
    @Published var showErrorAlert: Bool = false
    @Published var errorThrownMessage: String? = nil
    @Published var selectedCategory: Int = 2
    
    
    func fetchCategoryData(query: String, category: Int, start: Int) -> () {
        
        let catName = searchCategories[category]
        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        guard let eqUnwrapped = escapedQuery else {
            errorThrownMessage = "Error: bad search query."
            showErrorAlert = true
            return
        }
        
        let url = URL(string: "\(baseURL)/category/\(catName)/search?api_key=\(apiKey)&q=\(eqUnwrapped)&rows=\(maxRecordsToReturn)&start=\(start)")
        print(url)
        guard let urlUnwrapped = url else {
            errorThrownMessage = "Error: invalid URL."
            return
        }
        
        //clear the array to reset view
        self.items = []
        
        //set published var to true so ProgressView is shown
        queryInProgress = true
        
        request(urlUnwrapped){ [weak self] data, response, error in
            
            do {
                let document = try JSONDecoder().decode(CategoryDocumentModel.self, from: data)
                let result = document.response as CategoryResultsModel
                
                DispatchQueue.main.async {
                    self?.items = result.rows
                    self?.queryInProgress = false
                    self?.firstQueryFinished = true
                    self?.nextButtonDisabled = false
                    
                    if result.rows.count == 0 {
                        self?.nextButtonDisabled = true
                        self?.previousButtonDisabled = true
                    }
                    
                    for rec in result.rows {
                        var recCopy = rec
                        self?.fetchImage(for: recCopy, completion: { (record, result) -> () in
                            let image = try? result.get()
                            if let image = image {
                                recCopy.image = image
                            }
                        })
                    }
                }
            } catch (let reason) {
                self?.errorThrownMessage = "Error: \(reason)."
            }
        }
    }
    
    private func fetchImage(for record: ItemRecordModel, completion: @escaping (ItemRecordModel, Result<UIImage?, Error>) -> Void) {
        
        guard let urlString = record.imageUrl else {
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
    
    private func request(_ url: URL, completion: @escaping ((Data, HTTPURLResponse, Error?) -> Void)) {
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.errorThrownMessage = error.localizedDescription
                    self?.showErrorAlert = true
                }
                return
            }
            guard let response = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    self?.errorThrownMessage = "Error: Invalid response from server."
                    self?.showErrorAlert = true
                }
                return
            }
            guard response.statusCode >= 200, response.statusCode < 300 else {
                DispatchQueue.main.async {
                    self?.errorThrownMessage = "Error: Bad response from server: \(response.statusCode)"
                    self?.showErrorAlert = true
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    self?.errorThrownMessage = "Error: No data server."
                    self?.showErrorAlert = true
                }
                return
            }
            completion(data, response, error)
        }.resume()
    }
    
    //for Unit testing only
    func fetchDataFromFile () -> CategoryResultsModel {
        let url = Bundle.main.url(forResource:"Categories", withExtension: "json")!
        let jsonData = try! Data(contentsOf: url)
        let document = try! JSONDecoder().decode(CategoryDocumentModel.self, from: jsonData)
        let result = document.response as CategoryResultsModel
        
        return result
    }
    
}


