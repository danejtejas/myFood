//
//  Item.swift
//  ProductApp
//
//  Created by Tejas on 07/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit



/// Item is information about itme
class Item: NSObject {

    
    var id : String?      // id of item, it is unique idenficiation of item
    var name : String?    // name of item or product
    var desc : String?    // description of  item or product
    var price : CGFloat?   // price of item or product
    var image : String?     // item image
    var rating : Int?      // rating of itme
    
    init( name : String, desc : String, price : CGFloat, image : String, rating : Int) {
        
       self.id = UUID().uuidString
       self.name =  name
       self.desc =  desc
       self.price = price
       self.image = image
       self.rating = rating
       super.init()
        
    }
    
}


class Category : NSObject  {
    
    var ctName : String?   // name of category
    
    var catItems : [Item]? //  items in that category

     init( categoryName name : String , items : [Item] ) {
        self.ctName = name
        self.catItems = items
    }
    
    
    // add other item in that category
    func addItemsInCategory( item : Item)  {
        
        if catItems != nil
        {
            catItems?.append(item)
        }
        else
        {
            catItems = []
            catItems?.append(item)
        }
    }
    
}


// CategoryItemData
class CategoryItemData : NSObject {
    
    var arrCategories : [Category] = []
    
    override init() {
        
        let pizzaItem : [Item] = [Item(name: "Margherita", desc: "A hugely popular margherita, with a deliciously tangy single cheese topping", price: 199, image: "pizza", rating: 4)]
        
        let catPizza = Category(categoryName: "Pizza", items: pizzaItem)
        
        arrCategories.append(catPizza) // here add pizza categor and it's times
        
//        arrCategories.append(Category(categoryName: "Pizza", items: [Item(name: "Pizza Pizza Pizza Pizza Pizza", desc: "The pizza base was an inch thick and as white as my unfinished term paper. The sauce tasted like it came out of a can, a cheap one, and the topping was generous but greasy. Overly thick slices of pepperoni sat in pools of grease from the cheese. The only colour came from the shards of red pepper on top, likely the only edible thing on the plate if you didn't mind the oils on them too. One bite was enoug", price: 100, image: "pizza", rating: 4),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 101, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza")]))
//
//          arrCategories.append(Category(categoryName: "Pizza1", items: [Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza")]))
//
//
//                 arrCategories.append(Category(categoryName: "Pizza2", items: [Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza"),Item(name: "Pizza", desc: "Pizza", price: 100, image: "pizza")]))
        
       
    }
}
