//
//  Service.swift
//  MeliChallengeAPI
//
//  Created by Eduardo Hernandez on 11/06/23.
//

import Foundation
import ObjectMapper

class NetworkService {
    static let shared = NetworkService()
    
    private let baseURL = "https://api.mercadolibre.com/sites/MLM/search?q="
    
    func getItemsResult(itemToSearch: String, completion: @escaping ([Item]?, Error?) -> Void) {
        let url = URL(string: baseURL + itemToSearch)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                
                if let jsonDict = json as? [String: Any],
                   let itemResponseJSON = jsonDict["results"] as? [[String: Any]] {
                    
                    let items = Mapper<Item>().mapArray(JSONArray: itemResponseJSON)
                    completion(items, nil)
                    // Create dispatch group to wait for all image downloads
//                    let imageDownloadGroup = DispatchGroup()
//                    
//                    // Fetch image for each item
//                    for item in items {
//                        if let imageURLString = item.imageURL, let imageURL = URL(string: imageURLString) {
//                            imageDownloadGroup.enter()
//                            URLSession.shared.dataTask(with: imageURL) { data, response, error in
//                                defer {
//                                    imageDownloadGroup.leave()
//                                }
//                                
//                                guard let data = data, error == nil else {
//                                    return
//                                }
//                                
//                                item.imageURL = data
//                            }.resume()
//                        }
//                    }
//                    
//                    // Notify when all image downloads are completed
//                    imageDownloadGroup.notify(queue: .main) {
//                        completion(items, nil)
//                    }
                } else {
                    completion(nil, nil)
                }
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
