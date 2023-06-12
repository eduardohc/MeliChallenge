//
//  ItemViewCell.swift
//  MeliChallengeAPI
//
//  Created by Eduardo Hernandez on 12/06/23.
//

import UIKit

class ItemViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
