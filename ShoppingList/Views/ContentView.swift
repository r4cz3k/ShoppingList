//
//  ContentView.swift
//  ShoppingList
//
//  Created by Maciej Rak on 26/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ListView()
            .navigationTitle("Shopping List")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add"){
                        //functionality
                    }
                }
            }
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
