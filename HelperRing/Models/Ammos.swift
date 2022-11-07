//
//  Ammos.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/ammos
///

import Foundation

// MARK: - Ammos
struct Ammos: Codable {
    let success: Bool
    let count, total: Int
    let data: [Ammo]
}

// MARK: - Ammo
struct Ammo: Codable {
    let id, name: String
    let image: String?
    let datumDescription: String
    let type: TypeEnum?
    let attackPower: [AttackPower]
    let passive: String

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case type, attackPower, passive
    }
}

// MARK: - AttackPower
struct AttackPower: Codable {
    let name: Name
    let amount: Int?
}

enum Name: String, Codable {
    case critical = "critical"
    case fire = "fire"
    case holy = "holy"
    case lightning = "lightning"
    case magic = "magic"
    case phy100 = "Phy100"
    case phy20 = "Phy20"
    case phy40 = "Phy40"
    case physical = "physical"
}

enum TypeEnum: String, Codable {
    case pierce = "Pierce"
}
