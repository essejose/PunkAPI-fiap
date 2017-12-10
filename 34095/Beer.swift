//
//  Beer.swift
//  34095
//
//  Created by jose on 05/12/17.
//  Copyright © 2017 jose. All rights reserved.
//

import UIKit

class Beer {
    var id: Int
    var name: String
    var abv: Float
    var ibu: Float
    var tag: String
    var description: String
    var imageURL: String
    
    
    init(id: Int, name: String, tag: String, description: String, imageURL: String, abv: Float, ibu: Float) {
        
        self.id = id
        self.name = name
        self.tag = tag
        self.description = description
        self.imageURL = imageURL
        self.abv = abv
        self.ibu = ibu
        
    }
    
}
