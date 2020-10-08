//
//  ItemDetailsVC.swift
//  ProductApp
//
//  Created by Tejas on 08/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {

    
    @IBOutlet weak var itemDetailView : CardView!
    
    @IBOutlet weak var itemImageView : UIImageView!
    
    @IBOutlet weak var lblItemName : UILabel!

    @IBOutlet weak var lblItemPrice : UILabel!
    
    @IBOutlet weak var lblItemDesc : UILabel!
    
    @IBOutlet weak var ratingView : FloatRatingView!
    
    @IBOutlet weak var btnSelectItem : RoundButton!
    
   
    
    var item : Item?
    var isItemSelected = false
//    var indexPath : IndexPath?
    
    var onSelect : ((_ id : String , _ isSelect : Bool ) -> Void)? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLightMode()
        navigationItem.title = "Item Details"
        
       
        
        showItemDetails()
        
    }
    
    
    
    func showItemDetails()  {
       
        guard let item = item else {
            print("item nill ") ;
            return
        }
        
        itemImageView.image = UIImage(named: item.image! )
        lblItemName.text = item.name
        lblItemDesc.text = item.desc
        lblItemPrice.text = "Price: $\(item.price!)"
        ratingView.rating = Double(item.rating ?? 0)
        btnSelectItem.isSelected = !isItemSelected
        
    }
    

   @IBAction func btnSelectItemClick( _ sender : RoundButton)  {
   
    guard let onSelect = onSelect else { return  }
    
     onSelect(item!.id!, !isItemSelected )
    
    }

}
