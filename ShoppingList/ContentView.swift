//
//  ContentView.swift
//  ShoppingList
//
//  Created by Maciej Rak on 26/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    let dataService = DataService()
    @State var fruits:[String] = [String]()
    @State var vegetables:[String] = [String]()
    @State var hygiene:[String] = [String]()
    
    var body: some View {
        NavigationStack{
            List{
                Section(
                    header: Text("Fruits")
                ){
                    ForEach(fruits, id:\.self){fruit in
                        Text(fruit.capitalized)
                    }
                    .onDelete(perform: { indexSet in
                        removeFromList(&fruits, indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        moveInList(&fruits, indices, newOffset)
                    })
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
    
    func removeFromList(_ array: inout [String], _ indexSet: IndexSet){
        array.remove(atOffsets: indexSet)
    }
    
    func moveInList(_ array: inout [String], _ indices: IndexSet, _ newOffset: Int){
        array.move(fromOffsets: indices, toOffset: newOffset)
    }
}

#Preview {
    ContentView()
}
