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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemViewCell", for: indexPath)
        return cell
    }
    
    
}

