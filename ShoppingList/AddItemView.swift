//
//  AddItemView.swift
//  ShoppingList
//
//  Created by Maciej Rak on 05/10/2023.
//

import SwiftUI

struct AddItemView: View {
    
    @ObservedObject var dataService: DataService
    @State var itemName: String = String()
    @State var itemCount: String = String()
    @State var selectedCategory: String = "fruits"
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Add Item")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            Spacer()
            
            // MARK: TEXTFIELDS
            HStack{
                TextField(
                    "Item",
                    text: $itemName
                )
                .padding()
                .frame(maxWidth: UIScreen.main.bounds.size.width/1)
                .background(
                    Color.gray
                        .opacity(0.3)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                )
                .foregroundStyle(.primary)
                .font(.headline)
                
                TextField(
                    "Count",
                    text: $itemCount
                )
                .keyboardType(.decimalPad)
                .padding()
                .frame(maxWidth: UIScreen.main.bounds.size.width/4)
                .background(
                    Color.gray
                        .opacity(0.3)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                )
                .foregroundStyle(.primary)
                .font(.headline)
            }
            
            // MARK: PICKER
            Picker(
                selection: $selectedCategory,
                label: Text("Category Picker"),
                content:{
                    ForEach(Array(dataService.categories), id: \.self){category in
                        Image(systemName: category.sfName).tag(category.name)
                        
                    }
                }
            )
            .pickerStyle(SegmentedPickerStyle())

            
            // MARK: SELECTED CATEGORY TEXT
            HStack{
                Text("Category: ")
                    .font(.headline)
                Text(selectedCategory.capitalized)
                    .font(.subheadline)
            }
            
            // MARK: ADD BUTTON
            Button{
                if(textIsValid()){
                    addItem()
                    itemName = String()
                    itemCount = String()
                }
            }label:{
                Text("Save".uppercased())
                .padding()
                .frame(maxWidth: .infinity)
                .background(textIsValid() ? Color.blue.clipShape(RoundedRectangle(cornerRadius: 15)) : Color.gray.clipShape(RoundedRectangle(cornerRadius: 15)))
                .foregroundStyle(.white)
                .font(.headline)
            }
            .disabled(!textIsValid())
            Spacer()
        }
        .padding()
    }
    
    // MARK: FUNCTIONS
    func textIsValid()->Bool{
        if(itemName.count>=1 && itemCount.count >= 1){
            return true
        }else{
            return false
        }
    }
    
    func addItem(){
        dataService.addItem(name: itemName, category: selectedCategory, counter: Int(itemCount) ?? 1)
    }
}

#Preview {
    AddItemView(dataService: DataService())
}





