//
//  ContentView.swift
//  ShoppingList
//
//  Created by Maciej Rak on 05/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataService: DataService = DataService()
    
    init(){
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(Array(dataService.categories), id: \.self){category in
                    if(category.itemCounter > 0){
                        Section(
                            header: HStack{
                                Text(category.name)
                                Image(systemName: category.sfName)
                            }
                                .foregroundStyle(category.color)
                        ){
                            ForEach(dataService.items, id: \.self){item in
                                if(item.category == category.name){
                                    ListRow(itemName: item.name, itemCount: item.counter)
                                }
                            }
                            .onDelete(perform: dataService.deleteItem)
                            .onMove(perform: dataService.moveItem)
                        }
                    }
                }
            }
            .navigationTitle("Shopping List")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(
                        destination: AddItemView(dataService: dataService),
                        label: {
                            Text("Add")
                        }
                    )
                }
            }
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
