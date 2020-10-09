//
//  TableViewBannerCell.swift
//  ProductApp
//
//  Created by Tejas on 07/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit


/// TVBannerCell inside collection view for display banner images
class TVBannerCell: UITableViewCell {

    @IBOutlet weak var collectionView : UICollectionView!
    
    
    var arrBannerImages = ["banner.jpg", "pizza-banner.jpg", "pizza-banner1.jpg", "burger-banner.jpg" , "beverages-banner.jpg" , "snack-banner1.jpg"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TVBannerCell : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  arrBannerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVBannerCell", for: indexPath) as! CVBannerCell
        
        cell.bannerImageView.image = UIImage(named: arrBannerImages[indexPath.row])
        
        return cell
        
    }
    
    
}
