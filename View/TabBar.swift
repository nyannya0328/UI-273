//
//  TabBar.swift
//  UI-273
//
//  Created by nyannyan0328 on 2021/07/29.
//

import SwiftUI

struct TabBar: View {
    @State var currentTab = "Home"
    
    init(){
        
        UITabBar.appearance().isHidden = true
        
        
    }
    
    @Namespace var animation
    
    var body: some View {
        TabView(selection:$currentTab){
            
            
            Home()
                .tag("Home")
            
            Text("Message")
                .tag("Message")
            
            Text("Account")
                .tag("Account")
        }
        .overlay(
        
            HStack(spacing:0){
            
            
            CustomTabButton(title: "Home", image: "home", currentTab: $currentTab, animation: animation)
            
            CustomTabButton(title: "Message", image: "messenger", currentTab: $currentTab, animation: animation)
            
            CustomTabButton(title: "Account", image: "user", currentTab: $currentTab, animation: animation)
        }
               
                .padding(.vertical,20)
                .padding(.horizontal)
               .background(.black,in: Capsule())
                .padding(.horizontal,25)
              
            ,alignment: .bottom
        
        )
        
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

struct CustomTabButton : View{
    
    var title : String
    var image : String
    @Binding var currentTab : String
    var animation : Namespace.ID
    
    var body: some View{
        
        
        Button {
            
            withAnimation{
                
                currentTab = title
            }
            
        } label: {
            
            HStack(spacing:10){
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                
                
                if currentTab == title{
                    
                    
                    Text(title)
                        .font(.caption.bold())
                        .offset(x: -5)
                        
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.white.opacity(currentTab == title ? 0.2 : 0),in: Capsule()
            
                        
            
            )
            
            
          
        
            
            
        }

    }
}
