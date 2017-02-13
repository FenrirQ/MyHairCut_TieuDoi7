//
//  CellTVCell.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 11/5/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit

class CellTVCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
