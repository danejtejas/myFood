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
        
        
        // here setup pizza category and it's items data
        
        let pizzaItem : [Item] = [
            Item(name: "Margherita", desc: "A hugely popular margherita, with a deliciously tangy single cheese topping", price: 199, image: "Margherit", rating: 3),
            
            Item(name: "Farm house", desc: "A pizza that goes ballistic on veggies! Check out this mouth watering overload of crunchy, crisp capsicum, succulent mushrooms and fresh tomatoes", price: 349, image: "Farmhouse", rating: 4),
            
            Item(name: "Peppy Paneer", desc: "Chunky paneer with crisp capsicum and spicy red pepper - quite a mouthful!", price: 349, image: "Farmhouse", rating: 3),
            
            Item(name: "Mexican Green Wave", desc: "A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes and jalapeno with a liberal sprinkling of exotic Mexican herbs", price: 449, image: "MexicanGreenWave", rating: 2),
            
            Item(name: "Deluxe Veggie", desc: "For a vegetarian looking for a BIG treat that goes easy on the spices, this one's got it all.. The onions, the capsicum, those delectable mushrooms - with paneer and golden corn to top it all.", price: 299, image: "PeppyPaneer", rating: 4)
                    
                    ]
        
        let catPizza = Category(categoryName: "Pizza", items: pizzaItem)
        
        arrCategories.append(catPizza) // here add pizza categor and it's times
        
        
         // here setup Burgers category and it's items data
        
        let buggerItems : [Item] = [
        Item(name: "Big Mac", desc: "Mouthwatering perfection starts with two 100% pure beef patties and Big Mac sauce sandwiched between a sesame seed bun. It’s topped off with pickles, crisp shredded lettuce, finely chopped onion and American cheese", price: 150, image: "BigMac", rating: 3),
        
        Item(name: "Double Cheeseburger", desc: "The McDonald’s Double Cheeseburger features two 100% pure beef burger patties seasoned with just a pinch of salt and pepper. It’s topped with tangy pickles, chopped onions, ketchup, mustard and two slices of melty American cheese. It contains no artificial flavors, preservatives or added colors from artificial sources.* Our pickle contains an artificial preservative, so skip it if you like", price: 250, image: "DoubleCheeseburger", rating: 4),
        
        Item(name: "Double Quarter Pounder with Cheese", desc: "Each Double Quarter Pounder with Cheese features two quarter pound* 100% fresh beef burger patties that are hot, deliciously juicy and cooked when you order. McDonald’s beef patties are seasoned with just a pinch of salt and pepper, sizzled on a flat iron grill, then topped with slivered onions, tangy pickles and two slices of melty cheese on a sesame seed bun. It contains no artificial flavors, preservatives or added colors from artificial sources.** Our pickle contains an artificial preservative, so skip it if you like.", price: 200, image: "DoubleQuarterPounderwithCheese", rating: 3),
        
        Item(name: "Hamburger", desc: "The original burger starts with a 100% pure beef patty seasoned with just a pinch of salt and pepper, then topped with a tangy pickle, chopped onions, ketchup and mustard. It contains no artificial flavors, preservatives or added colors from artificial sources.* Our pickle contains an artificial preservative, so skip it if you like", price: 249, image: "Hamburger", rating: 2),
        
        Item(name: "Quarter Pounder with Cheese", desc: "Each Quarter Pounder with Cheese burger features a ¼ lb.* of 100% fresh beef that’s hot, deliciously juicy and cooked when you order. It’s seasoned with just a pinch of salt and pepper, sizzled on a flat iron grill, then topped with slivered onions, tangy pickles and two slices of melty cheese on a sesame seed bun. Our QPC® contains no artificial flavors, preservatives or added colors from artificial sources. **Our pickle contains an artificial preservative, so skip it if you like.", price: 199, image: "QuarterPounderwithCheese", rating: 4)
                
                ]
        
        let catBug = Category(categoryName: "Burgers", items: buggerItems)
        
        arrCategories.append(catBug) // here add Burgers categor and it's items
        
        
        // here setup beverages category and it's items data
        
        let beveragesItems : [Item] = [
        Item(name: "Coca-Cola", desc: "Coca-Cola is a refreshing myFood's soda option that complements all of your menu favorites", price: 100, image: "CocaColaClassicSmall", rating: 3),
        
        Item(name: "Diet Coke", desc: "Icy cold Diet Coke, with zero calories.", price: 250, image: "DietCokeSmall", rating: 4),
        
        Item(name: "Dr Pepper", desc: "myFood's serves Dr Pepper, the classic and refreshing fountain drink. This myFood's soda option is perfect to pair with any of your favorite menu items.", price: 200, image: "DrPepperSmall", rating: 3),
        
        Item(name: "Iced Tea", desc: "A refreshing drink of myFood's Iced Tea, freshly brewed with a brisk blend of orange pekoe and pekoe cut black tea, served ice cold", price: 249, image: "IcedTeaLarge", rating: 2)
        
                ]
        
        let catBeverages = Category(categoryName: "Beverages", items: beveragesItems)
        
        arrCategories.append(catBeverages) // here add Burgers categor and it's items
        
 
        
        
        
        // here setup snacks category and it's items data
        
        let snacksItems : [Item] = [
            Item(name: "Bacon, Egg & Cheese Biscuit", desc: "Bacon, Egg & Cheese Biscuit features a warm, buttermilk biscuit brushed with real butter, thick cut Applewood smoked bacon, a fluffy folded egg, and a slice of melty American cheese.", price: 100, image: "BaconEggCheeseBiscuitRegularSizeBiscuit", rating: 3),
            
            Item(name: "Fruit & Maple Oatmeal", desc: "Our Fruit and Maple Oatmeal has two full servings of whole-grain oats and a touch of cream. myFood's oatmeal is loaded with red and green apples, cranberries, and two varieties of raisins for a hearty, wholesome breakfast of whole-grain oatmeal and fruit. ", price: 250, image: "FruitMapleOatmeal", rating: 4),
            
            Item(name: "Sausage Burrito", desc: "The Sausage Burrito is myFood's Breakfast Burrito and is loaded with fluffy scrambled egg, pork sausage, melty cheese, green chiles and onion! It's wrapped in a soft tortilla, making it the perfect grab and go snack", price: 200, image: "SausageBurrito", rating: 3),
            
           Item(name: "Sausage, Egg & Cheese", desc: "Sausage, Egg & Cheese myFood feature soft, warm griddle cakes—with the sweet taste of maple—that hold a fluffy folded egg, savory sausage, and melty American cheese. McGriddles cakes have no artificial preservatives or flavors and no colors from artificial sources", price: 249, image: "SausageBiscuitwithEggRegularSizeBiscuit", rating: 2),
                    
            
            Item(name: "Sausage Biscuit", desc: "myFood's Sausage Biscuit is the perfect sausage breakfast sandwich, made with sizzling hot sausage on a warm buttermilk biscuit that’s topped with real butter and baked to perfection.", price: 199, image: "SausageBiscuitRegularSizeBiscuit", rating: 4)
            
        ]
        
        let catsnacks = Category(categoryName: "Snacks", items: snacksItems)
        
        arrCategories.append(catsnacks) // here add Snacks categor and it's items
        
        
        
       
    }
}
