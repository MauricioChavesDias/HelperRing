//
//  Item.swift
//  HelperRing
//
//  Created by Mauricio Dias on 20/10/2022.
//

import Foundation

struct DataModel {
    let data: [Data]
}

struct Data: Identifiable {
    let itemID, name: String
    let image: String?
    let description: String?
    let drops: [String]?
    let healthPoints: String? 
    let region: String?
    let location: String?
    let cardItem: CardItemType
    
    var id: String { itemID }
}
