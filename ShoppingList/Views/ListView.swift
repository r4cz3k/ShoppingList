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
    
    init(){
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        List{
            //For Each category and make a dictionary with category name and sf symbol name
            Section(
                header: HStack{
                    Text("Fruits")
                    Image(systemName: "leaf")
                }
                    .foregroundStyle(.green)
            ){
                ForEach(items, id: \.self){item in
                    if(item.category == "fruits"){
                        ListRow(itemName: item.name.capitalized,
                                itemCount: item.counter)
                        .swipeActions(allowsFullSwipe: true) {
                            
                            Button(role: .destructive) {
                                print("Deleting conversation")
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            Button {
                                //
                            } label: {
                                Label("Edit", systemImage: "pencil.and.scribble")
                            }
                            .tint(.blue)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    listManager.removeFromList(&items, indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    listManager.moveInList(&items, indices, newOffset)
                })
            }
            
            Section(
                header: HStack{
                    Text("Vegetables")
                    Image(systemName: "carrot")
                }
                    .foregroundStyle(.orange)
            ){
                ForEach(items, id: \.self){item in
                    if(item.category == "vegetables"){
                        ListRow(itemName: item.name.capitalized,
                                itemCount: item.counter)
                    }
                }
                .onDelete(perform: { indexSet in
                    listManager.removeFromList(&items, indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    listManager.moveInList(&items, indices, newOffset)
                })
            }
            
            Section(
                header: HStack{
                    Text("Hygiene")
                    Image(systemName: "shower.handheld")
                }
                    .foregroundStyle(.blue)
            ){
                ForEach(items, id: \.self){item in
                    if(item.category == "hygiene"){
                        ListRow(itemName: item.name.capitalized,
                                itemCount: item.counter)
                    }
                }
                .onDelete(perform: { indexSet in
                    listManager.removeFromList(&items, indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    listManager.moveInList(&items, indices, newOffset)
                })
            }
        }
        .onAppear(){
            items = dataService.items
        }
    }
}

#Preview {
    ListView()
}
