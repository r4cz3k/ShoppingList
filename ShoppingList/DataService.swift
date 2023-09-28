//
//  DataService.swift
//  ShoppingList
//
//  Created by Maciej Rak on 26/09/2023.
//

import Foundation
import SwiftUI //for Color in CategoryInfo

struct DataService{
    var items: [Item] = [
    Item(name: "apple",category: "fruits", counter: 4),
    Item(name: "banana",category: "fruits", counter: 1),
    Item(name: "tomato",category: "vegetables", counter: 8),
    Item(name: "potato",category: "vegetables", counter: 6),
    Item(name: "shampoo",category: "hygiene", counter: 3),
    Item(name: "soap",category: "hygiene", counter: 2),
    Item(name: "peach",category: "fruits", counter: 4),
    Item(name: "onion",category: "vegetables", counter: 9),
    Item(name: "toothbrush",category: "hygiene", counter: 1),
    ]
    
    mutating func addItem(name: String, category:String, counter: Int){
        items.append(Item(name: name, category: category, counter: counter))
    }
    
    typealias CategoryInfo = (sfName: String, color: Color)
    
    var categories:[String: CategoryInfo] = [
        "fruits" : CategoryInfo("leaf", .green),
        "vegetables" : CategoryInfo("carrot", .orange),
        "baking goods" : CategoryInfo("birthday.cake", .yellow),
        "meat" : CategoryInfo("fork.knife", .pink),
        "fish" : CategoryInfo("fish", .cyan),
        "hygiene" : CategoryInfo("shower.handheld", .blue),
        "pets" : CategoryInfo("pawprint", .brown)
    ]
}

struct Item: Hashable{
    var name: String
    var category: String
    var counter: Int
}
