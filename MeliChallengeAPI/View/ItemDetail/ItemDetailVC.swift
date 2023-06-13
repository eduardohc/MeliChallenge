//
//  ItemDetailVC.swift
//  MeliChallengeAPI
//
//  Created by Eduardo Hernandez on 12/06/23.
//

import UIKit

enum ItemCondition: String {
    case new
    case used
    
    func toString() -> String {
        switch self {
        case .new: return "Nuevo"
        case .used: return "Usado"
        }
    }
}

class ItemDetailVC: UIViewController {
    @IBOutlet weak var lb_itemDescription: UILabel!
    @IBOutlet weak var lb_itemCondition: UILabel!
    @IBOutlet weak var lb_itemPrice: UILabel!
    @IBOutlet weak var img_item: UIImageView!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
    }
    
    private func initializeViews() {
        guard let item = item else {
            return
        }
        
        lb_itemDescription.text = item.title
        
        let itemCondition = ItemCondition(rawValue: item.condition)
        lb_itemCondition.text = "\(itemCondition!.toString())"
        
        lb_itemPrice.text = "$\(item.price)"
        
        // Get item image from url

        let url = URL(string: item.imageURL)
        
        DispatchQueue.global().async {
            guard let unwrappedUrl = url else {
                return
            }
            
            let data = try? Data(contentsOf: unwrappedUrl)
            
            guard let unwrappedData = data else {
                return
            }
            
            DispatchQueue.main.async {
                self.img_item.image = UIImage(data: unwrappedData)
            }
        }
    }
}
