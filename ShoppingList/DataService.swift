//
//  DataService.swift
//  ShoppingList
//
//  Created by Maciej Rak on 05/10/2023.
//

import Foundation
import SwiftUI

// MARK: ITEM STRUCT
struct Item: Hashable{
    var name: String
    var category: String
    var counter: Int
}

// MARK: CATEGORY INFO
struct CategoryInfo: Hashable{
    var name: String
    var sfName: String
    var color: Color
    var itemCounter: Int
}

// MARK: DATASERVICE CLASS
class DataService: ObservableObject{
    @Published var items: [Item] = []
    
    var categories: [CategoryInfo] = [
        CategoryInfo(name: "fruits", sfName: "leaf", color: .green, itemCounter: 0),
        CategoryInfo(name: "vegetables", sfName: "carrot", color: .orange, itemCounter: 0),
        CategoryInfo(name: "baking goods", sfName: "birthday.cake", color: .yellow, itemCounter: 0),
        CategoryInfo(name: "meat", sfName: "fork.knife", color: .pink, itemCounter: 0),
        CategoryInfo(name: "fish", sfName: "fish", color: .cyan, itemCounter: 0),
        CategoryInfo(name: "hygiene", sfName: "shower.handheld", color: .blue, itemCounter: 0),
        CategoryInfo(name: "pets", sfName: "pawprint", color: .brown, itemCounter: 0),
        CategoryInfo(name: "household items", sfName: "house", color: .gray, itemCounter: 0)
    ]
    
    func addItem(name: String, category: String, counter: Int){
        items.append(Item(name: name, category: category, counter: counter))
        for index in 0..<categories.count {
            if categories[index].name == category{
                categories[index].itemCounter += 1
            }
        }
    }
    
    func deleteItem(index: IndexSet){
        for i in 0..<categories.count {
            for exactIndex in index{
                if items[exactIndex].category == categories[i].name{
                    categories[i].itemCounter -= 1
                    break
                }
            }
        }
        
        items.remove(atOffsets: index)
    }

    func moveItem(indices: IndexSet, newOffset: Int){
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
}
