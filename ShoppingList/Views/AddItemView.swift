//
//  AddItemView.swift
//  ShoppingList
//
//  Created by Maciej Rak on 28/09/2023.
//

import SwiftUI

struct AddItemView: View {
    
    @State var dataService = DataService()
    @State var itemName: String = String()
    @State var itemCount: String = String()
    @State var category = itemCategory.fruits
    @Binding var isVisible:Bool
    
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
            Button{
                if(textIsValid()){
                    addItem()
                    itemName = String()
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
                            category: String(describing: category),
                            counter: Int(itemCount) ?? 1)
    }
    
}

enum itemCategory{
    case fruits
    case vegetables
    case hygiene
}

#Preview {
    AddItemView(isVisible: Binding.constant(true))
}
