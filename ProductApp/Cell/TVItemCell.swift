//
//  TVItemCell.swift
//  ProductApp
//
//  Created by Tejas on 07/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class TVItemCell: UITableViewCell {

    @IBOutlet weak var blureView: UIVisualEffectView!
    @IBOutlet weak var itemImageView : CornerImageView!
    
    @IBOutlet weak var lblItemName : UILabel!
    
    @IBOutlet weak var lblItemPrice : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
