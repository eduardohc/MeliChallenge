//
//  NetworkServiceTests.swift
//  MeliChallengeAPITests
//
//  Created by Eduardo Hernandez on 12/06/23.
//

import XCTest
import ObjectMapper
@testable import MeliChallengeAPI

final class NetworkServiceTests: XCTestCase {
    
    func testGetItemsResult() {
        // Create an instance of NetworkService
        let networkService = NetworkService.shared
        
        // Define the expected items and error
        
        let expectedItems = testGettingItems()
        let expectedError: Error? = nil
        
        // Perform the getItemsResult method call
        networkService.getItemsResult(itemToSearch: "Test") { items, error in
            // Assert the results
//            XCTAssertEqual(items, expectedItems)
//            XCTAssertEqual(error, expectedError)
        }
    }
    
    func testGettingItems() -> [Item] {
        let itemTitles = [
            ["title": "Test item 1"],
            ["title": "Test item 2"],
            ["title": "Test item 3"]
        ]
        
        let expectedItems = itemTitles.compactMap {
            Item(map: Map(mappingType: .fromJSON, JSON: $0))
        }
        
        return expectedItems
    }
    
    func testGettinSingleItem() -> Item {
        let item = [
            ["title": "Test Item",
            "condition": "new",
            "price": 10.99,
            "imageURL": "https://example.com/image.jpg"]
        ]
        
        let expectedItem = item.compactMap { Item(map: Map(mappingType: .toJSON, JSON: $0)) }
        
        return expectedItem[0]
    }
}
