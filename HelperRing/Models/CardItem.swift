//
//  Home.swift
//  HelperRing
//
//  Created by Mauricio Dias on 19/10/2022.
//

import Foundation

struct CardItem: Identifiable, Hashable {
    var title: String
    var image: String
    var selectedCard: CardItemType
    var id: String { title }
}

