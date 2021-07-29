//
//  Item.swift
//  UI-273
//
//  Created by nyannyan0328 on 2021/07/29.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var title : String
    var price : String
    var subTitle : String
    var image : String
    var offset : CGFloat = 0
    
}

