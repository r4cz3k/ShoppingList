//
//  ListView.swift
//  ShoppingList
//
//  Created by Maciej Rak on 26/09/2023.
//

import SwiftUI

struct ListView: View {
    
    let dataService = DataService()
    let listManager = ListManager()
    @State var fruits:[String] = [String]()
    @State var vegetables:[String] = [String]()
    @State var hygiene:[String] = [String]()
    
    init(){
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        List{
            Section(
                header: Text("Fruits")
            ){
                if(fruits.count > 0){
                    ForEach(fruits, id:\.self){fruit in
                        Text(fruit.capitalized)
                    }
                    .onDelete(perform: { indexSet in
                        listManager.removeFromList(&fruits, indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        listManager.moveInList(&fruits, indices, newOffset)
                    })
                }else{
                    Text("No items added")
                }
            }
            
            Section(
                header: Text("Vegetables")
            ){
                if(vegetables.count > 0){
                    ForEach(vegetables, id:\.self){vege in
                        Text(vege.capitalized)
                    }
                    .onDelete(perform: { indexSet in
                        listManager.removeFromList(&vegetables, indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        listManager.moveInList(&vegetables, indices, newOffset)
                    })
                }else{
                    Text("No items added")
                }
            }
            
            Section(
                header: Text("Hygienie")
            ){
                if(hygiene.count > 0){
                    ForEach(hygiene, id:\.self){hyg in
                        Text(hyg.capitalized)
                    }
                    .onDelete(perform: { indexSet in
                        listManager.removeFromList(&hygiene, indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        listManager.moveInList(&hygiene, indices, newOffset)
                    })
                }else{
                    Text("No items added")
                }
            }
            
        }
        .onAppear(){
            fruits = dataService.items[0]
            vegetables = dataService.items[1]
            hygiene = dataService.items[2]
        }
    }
}

#Preview {
    ListView()
}
