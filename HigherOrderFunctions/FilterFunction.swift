//
//  FilterFunction.swift
//  HigherOrderFunctions
//
//  Created by Norah Alfari on 04/05/1445 AH.
//

import SwiftUI

struct FilterFunction: View {
    @State var search = ""
   
    var body: some View {
        NavigationView {
            
            ZStack{
                
                Image("coffee")
                    .resizable()
                    .opacity(0.30)
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false){
                    VStack(spacing: 20.0){
                        
                        ForEach(filter) { item in
                            
                            
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
                                        .foregroundStyle(Color.brown)
                                }
                                Spacer()
                                Image(systemName: "heart")
                            }.padding()
                                .background(RoundedRectangle(cornerRadius: 15)
                                    .fill(.white.opacity(0.25))
                                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/))
                            
                        }
                        
                        
                    }//Vstack
                    .padding(.horizontal)
                }
            }//Zstack
            
            
            .searchable(text: $search, prompt: "What are you looking for")
        }
        
    }
    
    var filter: [CoffeeItem] { // Changed "clothing" to "Clothing"
        if search.isEmpty { return allprodect}
        else{
            return allprodect.filter { $0.title.localizedCaseInsensitiveContains(search) }}
    }
}

struct CoffeeItem: Identifiable { // Changed "clothing" to "Clothing"
    var id = UUID()
    var imageName: String // Changed "imageNAme" to "imageName"
    var title: String
    var price: String
}

var allprodect = [
    CoffeeItem(imageName: "Image", title: "ICED SPANISH LATTE", price: "20"),
    CoffeeItem(imageName: "Image 1", title: "ICE LATTE",price: "15"),
    CoffeeItem(imageName: "Image 2", title: "PEACH TEA",price: "16"),
    CoffeeItem(imageName: "Image 3", title: "COFFEE OF TODAY",price: "30"),
    CoffeeItem(imageName: "Image 4", title: "ICE PISTACHIO", price: "25"),
    CoffeeItem(imageName: "Image 5", title: "ICE AMREICANO",price: "23"),
    CoffeeItem(imageName: "Image 6", title: "CORTADO",price: "12"),
]


#Preview {
    FilterFunction()
}
