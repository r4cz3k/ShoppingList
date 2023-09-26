//
//  ContentView.swift
//  ShoppingList
//
//  Created by Maciej Rak on 26/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    
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
                        isPresented = true
                    }
                    .sheet(isPresented: $isPresented, content: {
                        //Add a sheet with text input and category selection
                    })
                }
            }
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
