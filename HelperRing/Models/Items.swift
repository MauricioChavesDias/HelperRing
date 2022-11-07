//
//  Items.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/items

import Foundation

// MARK: - Items
struct Items: Codable {
    let success: Bool
    let count, total: Int
    let data: [Item]
}

// MARK: - Datum
struct Item: Codable {
    let id, name: String
    let image: String?
    let datumDescription: String
    let type: TypeEnumItem
    let effect: String

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case type, effect
    }
}

enum TypeEnumItem: String, Codable {
    case consumable = "Consumable"
    case misc = "Misc"
    case reusable = "Reusable"
}
