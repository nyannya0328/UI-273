//
//  Home.swift
//  UI-273
//
//  Created by nyannyan0328 on 2021/07/29.
//

import SwiftUI

struct Home: View {
    @State var size = "Medium"
    
    @State var current = "All"
    
    
    @State  var items = [
        
        Item(title: "Stylish Table Lamp", price: "$20.00", subTitle: "We have amazing quality Lamp wide range.", image: "lamp"),
        Item(title: "Modern Chair", price: "$60.00", subTitle: "New style of tables for your home and office.", image: "chair"),
        Item(title: "Wodden Stool", price: "$35.00", subTitle: "Amazing Stylish in multiple Most selling item of this.", image: "stool"),
    ]
    
    @GestureState var gesturoffset : Bool = false
    
    @State var cart : [Item] = []

    
    @Namespace var animation
    var body: some View {
        VStack{
            
            
            HStack{
                
                Button {
                    
                } label: {
                    
                    
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black)
                    
                    
                    
                }
                
                Spacer()
                
                
                Button {
                    
                } label: {
                    
                    
                    Image(systemName: "cart")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black)
                        .overlay(
                            
                            Text("\(cart.count)")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                                .background(.black,in: Circle())
                                .offset(x: 10, y: -25)
                                .opacity(cart.isEmpty ? 0 : 1)
                        
                        
                            ,alignment: .topTrailing
                        )
                    
                    
                    
                }

            }
            .padding(.horizontal)
            .padding(.top,15)
            .padding(.bottom,10)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing:10){
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            
                            Text("Furniture in Unique Style")
                                .font(.largeTitle.weight(.heavy))
                            
                            Text("We have wide range of Furniture")
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer(minLength: 15)
                        
                        
                        
                        Menu(content: {
                            
                            Button {
                                withAnimation{
                                    
                                    size = "Small"
                                }
                            } label: {
                                Text("Small")
                            }
                            
                            Button {
                                withAnimation{
                                    
                                    size = "Medium"
                                }
                            } label: {
                                Text("Medium")
                            }
                            
                            Button {
                                withAnimation{
                                    
                                    size = "Large"
                                }
                            } label: {
                                Text("Large")
                            }

                            
                            
                            
                        }) {
                            
                            
                            Label {
                                
                                Text(size)
                                
                            } icon: {
                                
                                Image(systemName: "slider.horizontal.3")
                                
                                
                            }
                            .font(.title3.bold())
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .foregroundColor(.red)
                            .background(.black,in: Capsule())

                            
                        }
                        
                        
                    }
                    .padding()
                    
                    
                    
                    HStack{
                        
                        
                        ForEach(["Tables","Chairs","Lampus","All"],id:\.self){item in
                            
                            
                            Button {
                                
                                withAnimation{
                                    
                                    current = item
                                }
                                
                            } label: {
                                
                                VStack{
                                    
                                    if current == item{
                                        
                                        
                                        Capsule()
                                            .fill(.green)
                                            .frame(height:3.5)
                                            .matchedGeometryEffect(id: "HOME-TAB", in: animation)
                                    }
                                    
                                    else{
                                        
                                        
                                        Capsule()
                                            .fill(.clear)
                                            .frame(height:3.5)
                                        
                                        
                                        
                                    }
                                    
                                    Text(item)
                                        .font(.title3.weight(.semibold))
                                }
                            }
                            .foregroundColor(current == item ? .black : .gray)
                            .frame(maxWidth: .infinity)

                            
                            
                        }
                    }
                    .padding()
                    
                    
                    ForEach(items.indices){index in
                        
                        
                        ZStack{
                            
                            Color.red
                                .cornerRadius(20)
                            
                            Color.blue
                                .cornerRadius(20)
                                .padding(.trailing,65)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                
                                Button {
                                    
                                } label: {
                                    
                                    Image(systemName: "swift")
                                        .font(.title)
                                        .frame(width: 65)
                                    
                                }
                                
                                Button {
                                    
                                    withAnimation{
                                        
                                        
                                        addkCart(index: index)
                                    }
                                    
                                } label: {
                                    
                                    Image(systemName:checkCart(index: index) ?  "cart.badge.minus" :"cart.badge.plus" )
                                        .font(.title)
                                        .frame(width: 65)
                                    
                                }


                            }
                            .foregroundColor(.white)
                            
                            CardView(item: items[index])
                                .offset(x:items[index].offset)
                                .gesture(
                                
                                
                                    DragGesture().updating($gesturoffset, body: { value, out, _ in
                                    
                                    
                                    out = true
                                })
                                    
                                        .onChanged({ value in
                                    
                                    if value.translation.width < 0 && gesturoffset{
                                        
                                        
                                        items[index].offset = value.translation.width
                                        
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                })
                                    
                                        .onEnded({ value in
                                    
                                    withAnimation{
                                        
                                        if -value.translation.width >= 100{
                                            
                                            
                                            items[index].offset = -130
                                        }
                                        
                                        else{
                                            
                                            items[index].offset = 0
                                            
                                            
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    
                                })
                                    
                                    
                                
                                )
                            
                            
                            
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        
                    }
                    
                    
                    
                    
                }
                .padding(.bottom,100)
                
                
            }
            
        }
    }
    
    func checkCart(index : Int) -> Bool{
        
        return cart.contains { (item) in
            
            
            return item.id == items[index].id
            
        }
        
        
    }
    
    func addkCart(index : Int){
        
        if checkCart(index: index){
            
            
            cart.removeAll { (item) in
                
                item.id == items[index].id
                
            }
        }
        
        else{
            
            cart.append(items[index])
        }
        
        items[index].offset = 0
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
