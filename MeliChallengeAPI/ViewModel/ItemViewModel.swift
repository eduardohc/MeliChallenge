//
//  ItemViewModel.swift
//  MeliChallengeAPI
//
//  Created by Eduardo Hernandez on 11/06/23.
//

import Foundation

class ItemViewModel {
    private let networkService: NetworkService
    
    var items: [Item] = []
    
    init(networkService: NetworkService = .shared) {
        self.networkService = networkService
    }
    
    func fetchItems(itemToSearch: String, completion: @escaping (Error?) -> Void) {
        // Call Network Service to fetch items
        networkService.getItemsResult(itemToSearch: itemToSearch) { [weak self] items, error in
            if let error = error {
                completion(error)
                return
            }
            
            self?.items = items ?? []
            completion(nil)
        }
    }
}
