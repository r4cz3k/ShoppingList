//
//  AddItemView.swift
//  ShoppingList
//
//  Created by Maciej Rak on 28/09/2023.
//

import SwiftUI

struct AddItemView: View {
    
    @State var dataService = DataService()
    @State var selectedCategory: String = "fruits"
    @State var itemName: String = String()
    @State var itemCount: String = String()
    @Binding var isVisible:Bool
    
    enum itemCategory: CaseIterable, Identifiable{
        case fruits
        case vegetables
        case hygiene
        
        var id: Self {self}
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Add Item")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Button{
                    isVisible.toggle()
                }label:{
                    Image(systemName: "xmark.circle")
                        .scaleEffect(2)
                        .tint(.red)
                        .padding(.horizontal)
                }
            }
            Spacer()
            HStack{
                TextField("Item",
                          text: $itemName)
                .padding()
                .background(Color.gray
                    .opacity(0.3)
                    .clipShape(RoundedRectangle(cornerRadius: 15)))
                .foregroundStyle(.black)
                .font(.headline)
                
                TextField("Count",
                          text: $itemCount)
                .keyboardType(.decimalPad)
                .padding()
                .frame(maxWidth:UIScreen.main.bounds.size.width/4)
                .background(Color.gray
                    .opacity(0.3)
                    .clipShape(RoundedRectangle(cornerRadius: 15)))
                .foregroundStyle(.black)
                .font(.headline)
            }
            Picker(
                selection: $selectedCategory,
                label: Text("Picker"),
                content:{
                    ForEach(itemCategory.allCases){category in
                        Text(String(describing: category)).tag(String(describing: category))
                    }
                }
            )
            .pickerStyle(SegmentedPickerStyle())
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
    func textIsValid()->Bool{
        if(itemName.count>=1 && itemCount.count >= 1){
            return true
        }
        return false
    }
    
    func addItem(){
        dataService.addItem(name: itemName,
                            category: selectedCategory,
                            counter: Int(itemCount) ?? 1)
    }
    
}

#Preview {
    AddItemView(isVisible: Binding.constant(true))
}
