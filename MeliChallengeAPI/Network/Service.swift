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
        
        // Perform fetch usin urlsession with url given
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            // Serialize object taking results from data response
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                
                if let jsonDict = json as? [String: Any],
                   let itemResponseJSON = jsonDict["results"] as? [[String: Any]] {
                    
                    // Map item response
                    let items = Mapper<Item>().mapArray(JSONArray: itemResponseJSON)
                    completion(items, nil)
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
