//
//  ItemViewModelTests.swift
//  MeliChallengeAPITests
//
//  Created by Eduardo Hernandez on 12/06/23.
//

import XCTest
@testable import MeliChallengeAPI

final class ItemViewModelTests: XCTestCase {
    
    class ItemViewModelTests: XCTestCase {
        
        func testFetchItems() {
            // Create a mock network service
            let mockNetworkService = MockNetworkService()
            
            // Create an instance of ItemViewModel with the mock network service
            let itemViewModel = ItemViewModel(networkService: mockNetworkService)
            
            // Define the expected items and error
            let expectedItems = [Item(title: "Item 1"), Item(title: "Item 2")]
            let expectedError: Error? = nil
            
            // Perform the fetchItems method call
            itemViewModel.fetchItems(itemToSearch: "Test") { error in
                // Assert the results
                XCTAssertEqual(itemViewModel.items, expectedItems)
                XCTAssertEqual(error, expectedError)
            }
        }
    }
    
    // Mock Network Service for testing purposes
    class MockNetworkService: NetworkService {
        override func getItemsResult(itemToSearch: String, completion: @escaping ([Item]?, Error?) -> Void) {
            // Simulate network response with expected items and error
            let expectedItems = [Item(title: "Item 1"), Item(title: "Item 2")]
            let expectedError: Error? = nil
            
            completion(expectedItems, expectedError)
        }
    }
}
