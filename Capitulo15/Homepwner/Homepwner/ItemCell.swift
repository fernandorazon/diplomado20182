//
//  ItemCell.swift
//  Homepwner
//
//  Created by Fernando Razon on 7/15/18.
//  Copyright © 2018 Fernando Razon. All rights reserved.
//

import UIKit
class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    //Esta funcion permite que los settings del usuario cambien automaticamente la vista de la app
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        nameLabel.adjustsFontForContentSizeCategory = true
//        serialNumberLabel.adjustsFontForContentSizeCategory = true
//        valueLabel.adjustsFontForContentSizeCategory = true
//    }
//    
}
