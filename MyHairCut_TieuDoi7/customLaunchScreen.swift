//
//  customLaunchScreen.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 12/7/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit

class customLaunchScreen: UIViewController {

    var launchImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.launchImage = UIImageView(frame: CGRect(x: 16, y: 151, width: 343, height: 283))
        self.launchImage.image = UIImage(named: "salon logo square")
        self.view.addSubview(self.launchImage)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
