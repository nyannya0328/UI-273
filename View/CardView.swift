//
//  CardView.swift
//  UI-273
//
//  Created by nyannyan0328 on 2021/07/29.
//

import SwiftUI

struct CardView: View {
    var item : Item
    var body: some View {
        HStack{
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 3.2)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text(item.title)
                    .font(.title.bold())
                    .foregroundColor(.black)
                
                Text(item.subTitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                
                Text(item.price)
                    .font(.title.weight(.heavy))
                    .foregroundColor(.orange)
                
                
            }
            
            Spacer()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 30)
      
        .background(.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5)
    
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
