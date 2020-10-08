//
//  CardView.swift
//  ProductApp
//
//  Created by Tejas on 08/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var cornerRadius : CGFloat = 10 {
        didSet {
            setup()
        }
    }
    
    var shadowOffset : CGSize = CGSize(width: 1, height: 2.0){
        
        didSet {
            setup()
        }
    }
    
    
    var shadowRadius : CGFloat = 2 {
        didSet {
            setup()
        }
    }
    
    
    var shadowOpacity : Float = 2 {
        didSet {
            setup()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    func  setup()  {
        
        
        
        layer.cornerRadius = cornerRadius
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        
        
        
        
    }
    
}
