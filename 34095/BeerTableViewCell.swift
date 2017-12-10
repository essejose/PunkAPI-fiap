//
//  BeerTableViewCell.swift
//  34095
//
//  Created by jose on 05/12/17.
//  Copyright © 2017 jose. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgBeer: UIImageView!
    @IBOutlet weak var tfName: UILabel!
    @IBOutlet weak var tfABV: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
}

