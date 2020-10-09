//
//  ViewController.swift
//  ProductApp
//
//  Created by Tejas on 07/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit


class CategoryVC: UIViewController {
    
    
    // list of category and it's items
    var arrCategoriesItems : [Category] = []
    
    
    var selectedItems : [String] = [] // information about selected item id
    
    
    // arrIsUnfold is contain  true or false value for unfold section
    var arrIsUnfold : [Bool] = []
    
    
    var indexPath : IndexPath?
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       setLightMode()
           
        navigationItem.title = "Category"
        
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }

   
    
    
    
    // load data on tableview
    func loadData()  {
        
        arrCategoriesItems = CategoryItemData().arrCategories
         
        arrIsUnfold = Array(repeating: true, count: arrCategoriesItems.count )
        
       
        
        tableView.reloadData()
        
    }
    
    
}



//MARK:- UITableViewDataSource
extension CategoryVC : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 + arrCategoriesItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        if section == 0  // banner images section
        {
            return 1
        }
        else
        {
            return  arrCategoriesItems[section - 1].catItems?.count ?? 0
        }
        
     
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  indexPath.row == 0 && indexPath.section == 0  // banner images section
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVBannerCell", for: indexPath) as! TVBannerCell
            cell.selectionStyle = .none
            return cell
        }
        else
        {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVItemCell", for: indexPath) as! TVItemCell
            cell.selectionStyle = .none
            
            let objItem = arrCategoriesItems[indexPath.section - 1].catItems![indexPath.row]
            
            cell.itemImageView?.image = UIImage(named: objItem.image!)
            cell.lblItemName.text =  objItem.name
//            cell.lblItemDesc.text =  objItem.desc
            cell.lblItemPrice.text =  "Price: $\(objItem.price!)"
            
            cell.blureView.isHidden = !isItemSelectedBy(itemId: objItem.id!)
            
            return cell
        }
         
        
    }
}


//MARK:- UITableViewDelegate
extension CategoryVC : UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.section == 0 && indexPath.row == 0  //banner image section
        {
            return
        }
        
        
        self.indexPath = indexPath
        
        let itemDetailsVC = storyboard?.instantiateViewController(withIdentifier: "ItemDetailsVC") as! ItemDetailsVC
        
        let item = arrCategoriesItems[indexPath.section - 1].catItems![indexPath.row]
        
        itemDetailsVC.item = item
        
        itemDetailsVC.isItemSelected = isItemSelectedBy(itemId : item.id! )
        
        itemDetailsVC.onSelect = { [weak self] (id, isSelect) in
            
            itemDetailsVC.navigationController?.popViewController(animated: true)
            self?.itemSelectOrDeselectby(itemId: id, isSelect: isSelect)
            
        }
        
        navigationController?.pushViewController(itemDetailsVC, animated: true)
        
    }
     
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 0 { return nil }
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section == 0 { return 0 }
        
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if  section == 0 { return nil }
        let hView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 60))
        hView.backgroundColor =  #colorLiteral(red: 0.2391922772, green: 0.2392312288, blue: 0.2391799986, alpha: 1)   //.red
        let lblHeaderTitle = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.bounds.width - 40, height: 40))
        lblHeaderTitle.center.y = hView.center.y
        lblHeaderTitle.font =  UIFont(name: "Futura-Bold", size: 20)
        lblHeaderTitle.text = arrCategoriesItems[section - 1].ctName
        lblHeaderTitle.textColor  = .white
        hView.addSubview(lblHeaderTitle)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestrueHandle))
        hView.tag = section
        hView.addGestureRecognizer(tapGesture)
        
        return hView
    }
    
    
    // tap gesture on tableview header for fold and unfold feature
    @objc func tapGestrueHandle( _ gesture : UITapGestureRecognizer)  {
        
        let section = gesture.view!.tag
        arrIsUnfold[section - 1] =   !arrIsUnfold[section - 1]
        let numRow =   tableView.numberOfRows(inSection: section)
        
        for index in 0...numRow - 1
        {
            tableView.reloadRows(at: [IndexPath(row: index, section: section)], with: UITableView.RowAnimation.automatic)
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
         if  section == 0 { return 0 } // banner image section hide
         
        return 60
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        // banner images cell
        if  indexPath.section == 0 && indexPath.row == 0
        {
            return 200
        }
        else
        {
            if arrIsUnfold[indexPath.section - 1]
            {
                return 0
            }
            else
            {
                return UITableView.automaticDimension
            }
        }
    }
    
    
    
}


/// Helper methods
extension CategoryVC {
    
    
    func itemSelectOrDeselectby(itemId id : String, isSelect : Bool)
    {
        // here item is select
        if isSelect {
            selectedItems.append(id)  // add item id into selecte items
            
           
            
        }
        else
        {
            let index = selectedItems.firstIndex(of: id)
            if let index = index
            {
                selectedItems.remove(at: index)  //  remove item id from selected items
            }
        }
    
        
        // update staus on particalr cell
        if  let cell = tableView.cellForRow(at: indexPath!) as? TVItemCell
        {
            cell.blureView.isHidden = !isSelect
        }
        
        
    }
    
    func isItemSelectedBy(itemId id : String ) -> Bool
    {
        let selectedItemCode =  selectedItems.first { $0 == id }
        if selectedItemCode != nil {
            return true
        }
        
        return false
    }
}
