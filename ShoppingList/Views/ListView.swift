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
    @State var items: [Item] = [Item]()
    @State var categories: [String : DataService.CategoryInfo] = [String : DataService.CategoryInfo]()
    
    
    init(){
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        List{
            ForEach(Array(categories.keys), id: \.self){key in
                let value = categories[key]
                
                Section(
                    header: HStack{
                        Text(key.capitalized)
                        Image(systemName: value!.sfName)
                    }
                        .foregroundStyle(value!.color)
                ){
                    ForEach(items, id: \.self){item in
                        if(item.category == key){
                            ListRow(itemName: item.name.capitalized,
                                    itemCount: item.counter)
                            .swipeActions(allowsFullSwipe: true) {
                                
                                Button(role: .destructive) {
                                    print("Deleting item")
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                                Button {
                                    //Perform edit
                                } label: {
                                    Label("Edit", systemImage: "pencil.and.scribble")
                                }
                                .tint(.blue)
                            }
                        }
                    }
                    .onMove(perform: { indices, newOffset in
                        listManager.moveInList(&items, indices, newOffset)
                    })
                }
            }
        }
        .onAppear(){
            items = dataService.items
            categories = dataService.categories
        }
    }
}

#Preview {
    ListView()
}
