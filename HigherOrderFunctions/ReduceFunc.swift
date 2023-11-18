//
//  ReduceFunc.swift
//  HigherOrderFunctions
//
//  Created by Norah Alfari on 04/05/1445 AH.
//

import SwiftUI

struct ReduceFunc: View {
    let sum =  allItems.reduce(0) { $0 + $1.price }
    let shipping:Double = 16
    let vatRate:Double = 0.20
    
    @State private var value = 0
      
    
    
    var body: some View {
        
        VStack{
            HStack{
                Text("Shopping Cart")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                })
            }
            
            Divider()
            
            
            
            
            
            
            ForEach(allItems) { item in
                
                
                
                HStack{
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 100,height: 100)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(item.title)
                                .font(.caption)
                            Spacer()
                            Text("$\(item.price, specifier: "%.2f")")
                                .font(.caption)
                        }
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("In Stock")
                                .font(.caption)
                                .foregroundStyle(Color.green)
                        }).background(RoundedRectangle(cornerRadius: 5)
                            .fill(.green.opacity(0.10))
                            .frame(width: 55,height: 20))
                        
                        HStack{
                            Circle()
                                .frame(width: 10,height: 10)
                                .foregroundColor(.black.opacity(0.60))
                            Text(item.color)
                                .font(.caption)
                        }
                        
                        
                        HStack(spacing: 0.0){
                            Image(systemName: "trash")
                            Text("Remove")
                                .font(.caption)
                            
                            Image(systemName: "bookmark.fill")
                            Text("Save for later")
                                .font(.caption)
                            Spacer()
                            
                            Stepper("", value: $value, in: 0...15)
                            
                            
                        }.foregroundStyle(Color.gray)
                        
                        
                    }
                    
                    
                    
                }
                
                Divider()
            }
            
            VStack(spacing: 12){
                HStack{
                    Text("Subtotal")
                    Spacer()
                    Text("$\(sum, specifier: "%.2f")")
                    
                }.font(.caption)
                .foregroundStyle(Color.gray)
                
                
                HStack{
                    Text("Shipping")
                    Spacer()
                    Text("$\(shipping, specifier: "%.2f")")
                    
                }.font(.caption)
                .foregroundStyle(Color.gray)
                
                
                
                HStack{
                    Text("VAT(20%)")
                    Spacer()
                    Text("\(sum *  vatRate, specifier: "%.2f")")
                    
                }.font(.caption)
                .foregroundStyle(Color.gray)
                
                
            }
            
            Divider()
            
            
            HStack{
                Text("Total")
                    
                Spacer()
                Text("\(sum + shipping + sum *  vatRate, specifier: "%.2f")")
                
            }
                .bold()
            
            
            
       
        }.padding()
        
        
//        Text("\(sum *  vatRate, specifier: "%.2f")")
//        Text("\(sum + shipping + sum *  vatRate, specifier: "%.2f")")
    }
}





struct Item: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var price: Double
    var color: String
 
}

var allItems = [
    Item(imageName: "laptop", title:"MacBook Air 13.6 Laptop", price: 1199, color: "Space Gray"),
    Item(imageName: "airpod", title:"AirPods Max", price: 249, color: "Midnight"),
]


#Preview {
    ReduceFunc()
}
