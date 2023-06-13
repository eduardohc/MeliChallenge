//
//  ViewControllerTest.swift
//  MeliChallengeAPITests
//
//  Created by Eduardo Hernandez on 12/06/23.
//

import XCTest
@testable import MeliChallengeAPI

final class ViewControllerTests: XCTestCase {
    var sut: ViewController!
    var itemViewModel: ItemViewModel!
    var items: [Item?] = []
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "Main") as? ViewController
        sut.loadViewIfNeeded()
        itemViewModel = ItemViewModel()
        items = []
    }
    
    override func tearDownWithError() throws {
        sut = nil
        itemViewModel = nil
        items = []
    }
    
    func testSearchItemButtonTapped_WithNoItems() {
        // Set up initial state
        sut.tf_search.text = "iPhone"
        
        // Simulate search item button tap
        sut.searchItem(UIButton())
        
        // Assert the expected behavior after the searchItem method is called
        XCTAssertFalse(sut.img_emptyList.isHidden)
        XCTAssertFalse(sut.lbl_emptyList.isHidden)
        XCTAssertEqual(sut.items.count, 0)
        XCTAssertEqual(sut.tableView_items.numberOfRows(inSection: 0), 0)
    }
    
    func testTextFieldDidChange_WithNoItems() {
        // Set up initial state
        sut.tf_search.text = "iPad"
        
        // Simulate text field value change
        sut.textFieldDidChange(sut.tf_search)
        
        // Assert the expected behavior after the textFieldDidChange method is called
        XCTAssertFalse(sut.img_emptyList.isHidden)
        XCTAssertFalse(sut.lbl_emptyList.isHidden)
        XCTAssertEqual(sut.items.count, 0)
        XCTAssertEqual(sut.tableView_items.numberOfRows(inSection: 0), 0)
    }
    
    func testTextFieldDidChange_WithItems() {
        // Set up initial state
        sut.tf_search.text = "Apple"
        
        // Simulate text field value change
        sut.textFieldDidChange(sut.tf_search)
        
        // Assert the expected behavior after the textFieldDidChange method is called
        XCTAssertTrue(sut.img_emptyList.isHidden)
        XCTAssertTrue(sut.lbl_emptyList.isHidden)
        XCTAssertEqual(sut.items.count, 5) // Assuming there are 5 items in the response
        XCTAssertEqual(sut.tableView_items.numberOfRows(inSection: 0), 5)
    }
    
    func testNumberOfRowsInSection() {
        // Set up initial state
        sut.items = NetworkServiceTests().testGettingItems()
        
        // Call the method under test
        let numberOfRows = sut.tableView(sut.tableView_items, numberOfRowsInSection: 0)
        
        // Assert the expected number of rows
        XCTAssertEqual(numberOfRows, 3)
    }
    
    func testCellForRowAt() {
        // Set up initial state
        let tableView = UITableView()
        
        tableView.register(ItemViewCell.self, forCellReuseIdentifier: "ItemViewCell")
        tableView.dataSource = sut
        
        sut.items = [NetworkServiceTests().testGettinSingleItem()]
        
        // Call the method under test
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(tableView, cellForRowAt: indexPath) as? ItemViewCell
        
        // Assert the expected cell properties
        XCTAssertEqual(cell?.itemDescription.text, "Test Item")
    }
    
    func testDidSelectRowAt() {
        // Set up initial state
        let navigationController = UINavigationController()
        let storyboard = UIStoryboard(name: "ItemDetail", bundle: nil)
        let itemDetailVC = storyboard.instantiateViewController(withIdentifier: "ItemDetail") as! ItemDetailVC
        sut.items = [NetworkServiceTests().testGettinSingleItem()]
        navigationController.pushViewController(sut, animated: false)
        navigationController.pushViewController(itemDetailVC, animated: false)
        
        // Call the method under test
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(sut.tableView_items, didSelectRowAt: indexPath)
        
        // Assert the expected navigation behavior and passed data
        XCTAssertEqual(navigationController.viewControllers.count, 3)
        XCTAssertTrue(navigationController.viewControllers.contains(itemDetailVC))
        XCTAssertEqual(itemDetailVC.item?.title, "Selected Item")
    }
    
}
