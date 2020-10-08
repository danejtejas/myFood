//
//  CardView.swift
//  ProductApp
//
//  Created by Tejas on 08/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class CardView: UIView {
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    func  setup()  {
        
        
        
        layer.cornerRadius = 10
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 2.0)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.8
        
        
        
        
    }
    
}
