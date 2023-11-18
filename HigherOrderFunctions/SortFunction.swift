//
//  SortFunction.swift
//  HigherOrderFunctions
//
//  Created by Norah Alfari on 04/05/1445 AH.
//

import SwiftUI

struct SortFunction: View {
   
    @State  var choice = 0
    
    var body: some View {
        
        NavigationView {
            
         
                
              
                
                ScrollView (showsIndicators: false){
                   
                    VStack(spacing: 20.0){
                        
                        ForEach(sort) { item in
                            
                            
                            //repet
                            HStack{
                                Image(item.imageName)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                VStack(alignment: .leading){
                                    Text(item.title)
                                        .bold()
                                    Text("Price: \(item.price) SR")
                                        .bold()
                                        .foregroundStyle(Color.green)
                                }
                                Spacer()
                                Image(systemName: "heart")
                                    
                            }.padding()
                                .background(RoundedRectangle(cornerRadius: 15)
                                    .fill(.white.opacity(0.25))
                                    .frame(height: 100))
                            
                        }
                        
                        
                    }//Vstack
                    .padding(.horizontal)
                }
           
            
            .navigationBarItems(trailing:   Picker("What is your favorite color?", selection: $choice) {
                Image(systemName: "arrow.up.arrow.down").tag(0)
                Text("Sort By Price: low to high").tag(1)
                Text("Sort By Price:  high to low").tag(2)
                
            }.pickerStyle(.menu).tint(.black))
            
            .navigationBarItems(leading:  Text("Burger"))
            
            
        }
        
    }
    
    var sort: [BurgerItem] { // Changed "clothing" to "Clothing"
        if choice == 0 { return allBurger}
        
        else if choice == 1 {
            return allBurger.sorted(by: { $0.price <
                $1.price })
        }else {
            return allBurger.sorted(by: { $0.price >
                $1.price })
        }
    }
}



struct BurgerItem: Identifiable { // Changed "clothing" to "Clothing"
    var id = UUID()
    var imageName: String // Changed "imageNAme" to "imageName"
    var title: String
    var price: String
}

var allBurger = [
    BurgerItem(imageName: "B1", title: "Maple Plus", price: "22"),
    BurgerItem(imageName: "B2", title: "Crispy Plus",price: "27"),
    BurgerItem(imageName: "B3", title: "Arabic Plus",price: "32"),
    BurgerItem(imageName: "B4", title: "Mushroom Plus Burger",price: "30"),
    BurgerItem(imageName: "B5", title: "Grilled Chicken", price: "25"),
    BurgerItem(imageName: "B6", title: "Wow Plus",price: "23"),
    BurgerItem(imageName: "B7", title: "Pineapple Plus",price: "35"),
]





#Preview {
    SortFunction()
}
