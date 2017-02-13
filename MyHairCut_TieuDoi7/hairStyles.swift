//
//  hairStyles.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 11/5/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit

class hairStyles {
    
    var name : String!
    var img : UIImage!
    
    init(tenImg : String, name : String) {
        self.name = name
        self.img = UIImage(named: tenImg)
    }
    
    
    
}
