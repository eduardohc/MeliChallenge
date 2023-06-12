//
//  NetworkServiceTests.swift
//  MeliChallengeAPITests
//
//  Created by Eduardo Hernandez on 12/06/23.
//

import XCTest
@testable import MeliChallengeAPI

final class NetworkServiceTests: XCTestCase {

    func testGetItemsResult() {
            // Create an instance of NetworkService
            let networkService = NetworkService.shared
            
            // Define the expected items and error
            let expectedItems = [Item(title: "Item 1"), Item(title: "Item 2")]
            let expectedError: Error? = nil
            
            // Perform the getItemsResult method call
            networkService.getItemsResult(itemToSearch: "Test") { items, error in
                // Assert the results
                XCTAssertEqual(items, expectedItems)
                XCTAssertEqual(error, expectedError)
            }
        }
}
