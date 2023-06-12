//
//  ViewController.swift
//  MeliChallengeAPI
//
//  Created by Eduardo Hernandez on 11/06/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn_search: UIButton!
    @IBOutlet weak var tf_search: UITextField!
    
    @IBOutlet weak var tableView_items: UITableView!
    
    @IBOutlet weak var img_emptyList: UIImageView!
    @IBOutlet weak var lbl_emptyList: UILabel!
    
    let itemViewModel = ItemViewModel()
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
    }
    
    private func initializeViews() {
        tableView_items.delegate = self
        tableView_items.dataSource = self
        tf_search.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func searchItem(_ sender: Any) {
        let itemToSearch = tf_search.text!
        
        let textWithoutSpaces = itemToSearch.replaceSpaces(text: itemToSearch)
        self.fetchItems(itemToSearch: textWithoutSpaces)
    }
    
    func fetchItems(itemToSearch: String) {
        itemViewModel.fetchItems(itemToSearch: itemToSearch) { [weak self] _ in
            self?.items = self?.itemViewModel.items ?? []
            
            DispatchQueue.main.async {
                self?.hideEmptyView()
                self?.tableView_items.reloadData()
            }
        }
    }
    
    func hideEmptyView() {
        if items.count < 1 {
            img_emptyList.isHidden = false
            lbl_emptyList.isHidden = false
        } else {
            img_emptyList.isHidden = true
            lbl_emptyList.isHidden = true
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let itemToSearch = tf_search.text!
        
        let textWithoutSpaces = itemToSearch.replaceSpaces(text: itemToSearch)
        self.fetchItems(itemToSearch: textWithoutSpaces)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemViewCell", for: indexPath) as! ItemViewCell
        let item = items[indexPath.row]
        cell.itemDescription.text = item.title
        return cell
    }
}
