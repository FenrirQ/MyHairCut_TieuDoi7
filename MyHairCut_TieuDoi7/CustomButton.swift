//
//  CustomButton.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 12/7/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 6.0
    }
}
