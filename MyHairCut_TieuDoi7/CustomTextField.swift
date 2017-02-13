//
//  CustomTextField.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 12/8/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

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
        
        switch tag {
        case 101:
            createLeftView(imageName: "Inbox_000000_25")
        case 102:
            createLeftView(imageName: "Lock_000000_25")
        case 103:
            createLeftView(imageName: "Lock_000000_25")
        case 104:
            createLeftView(imageName: "Contacts")
        default:
            print("No text field")
        }
        leftViewMode = .always
    }

    func createLeftView(imageName : String){
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 19, height: 19))
        leftIconView.image = UIImage(named: imageName)
        
        let paddingView = UIView(frame : CGRect(x: 0, y: 0, width: 44, height: 45))
        
        leftIconView.center = paddingView.center
        
        paddingView.addSubview(leftIconView)
        
        leftView = paddingView
    }
    
}
