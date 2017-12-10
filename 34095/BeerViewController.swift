//
//  BeerViewController.swift
//  34095
//
//  Created by jose on 05/12/17.
//  Copyright © 2017 jose. All rights reserved.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {
    
    @IBOutlet weak var imgBeer: UIImageView!
    @IBOutlet weak var tfName: UILabel!
    @IBOutlet weak var tfDesc: UILabel!
    @IBOutlet weak var tfABV: UILabel!
    @IBOutlet weak var tfIBU: UILabel!
    @IBOutlet weak var tfTag: UILabel!
    
    var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        loadBeerValues()
    }
    
    func loadBeerValues() {
        
        
        
        if beer != nil {
            
            
            
            let url = ImageResource(downloadURL: URL(string: (beer?.imageURL)!)!, cacheKey: beer?.name)
            let name = beer!.name
            let description = beer!.description
            let tag = beer!.tag
            let abv = beer!.abv
            let ibu = beer!.ibu
            
            imgBeer.kf.setImage(with: url)
            tfName.text = name
            tfDesc.text = description
            tfTag.text = tag
            tfABV.text = String(format: "%.1f", abv)
            tfIBU.text = String(format: "%.1f", ibu)
            
        }
        
    }
}
