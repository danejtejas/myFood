//
//  UIViewControllerExestion.swift
//  Trivia App
//
//  Created by Tejas on 06/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit



extension UIViewController
{
    
    
    func setLightMode()
    {
        if #available(iOS 13, *)
        {
            overrideUserInterfaceStyle = .light
        }
        
    }
    
}
