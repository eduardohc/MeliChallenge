//
//  ItemDetailTests.swift
//  MeliChallengeAPITests
//
//  Created by Eduardo Hernandez on 12/06/23.
//

import XCTest
import ObjectMapper
@testable import MeliChallengeAPI

final class ItemDetailTests: XCTestCase {

    class ItemDetailVCTests: XCTestCase {
        
        func testInitializeViews() {
            // Create an instance of ItemDetailVC
            let itemDetailVC = ItemDetailVC()
            
            // Create a mock item
            let mockItem = NetworkServiceTests().testGettinSingleItem()
            
            // Set the mock item to the item property of ItemDetailVC
            itemDetailVC.item = mockItem
            
            // Perform the initializeViews method call
//            itemDetailVC.initializeViews()
            
            // Assert the view properties
            XCTAssertEqual(itemDetailVC.lb_itemDescription.text, "Test Item")
            XCTAssertEqual(itemDetailVC.lb_itemCondition.text, "Nuevo")
            XCTAssertEqual(itemDetailVC.lb_itemPrice.text, "$10.99")
            
            // Simulate loading the image asynchronously
            DispatchQueue.main.sync {
                let imageData = UIImage(named: "mock_image")?.pngData()
                itemDetailVC.img_item.image = UIImage(data: imageData!)
            }
            
            // Assert the image view
            XCTAssertNotNil(itemDetailVC.img_item.image)
        }
    }

}
