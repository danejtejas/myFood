//
//  CornerImageView.swift
//  ProductApp
//
//  Created by Tejas on 08/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class CornerImageView: UIImageView {

    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    fileprivate func setup()
    {
        layer.cornerRadius = 5
        
    }
    

}
