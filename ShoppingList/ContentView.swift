//
//  ContentView.swift
//  ShoppingList
//
//  Created by Maciej Rak on 26/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    let dataService = DataService()
    let listManager = ListManager()
    @State var fruits:[String] = [String]()
    @State var vegetables:[String] = [String]()
    @State var hygiene:[String] = [String]()
    
    var body: some View {
        NavigationStack{
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
                
                
            }
            .navigationTitle("Shopping List")
        }
        .onAppear(){
            fruits = dataService.items[0]
            vegetables = dataService.items[1]
            hygiene = dataService.items[2]
        }
    }
}

#Preview {
    ContentView()
}
