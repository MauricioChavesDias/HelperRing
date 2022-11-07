//
//  Weapons.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/weapons

import Foundation

// MARK: - Weapons
struct Weapons: Codable {
    let success: Bool
    let count, total: Int
    let data: [Weapon]
}

// MARK: - Weapon
struct Weapon: Codable {
    let id, name: String
    let image: String?
    let datumDescription: String
    let attack, defence: [Attack]
    let scalesWith: [ScalesWith]
    let requiredAttributes: [Attack]
    let category: String
    let weight: Double

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case attack, defence, scalesWith, requiredAttributes, category, weight
    }
}

// MARK: - Attack
struct Attack: Codable {
    let name: AttackName
    let amount: Int
}

enum AttackName: String, Codable {
    case arc = "Arc"
    case boost = "Boost"
    case crit = "Crit"
    case dex = "Dex"
    case fai = "Fai"
    case fire = "Fire"
    case holy = "Holy"
    case int = "Int"
    case ligt = "Ligt"
    case mag = "Mag"
    case phy = "Phy"
    case rng = "Rng"
    case str = "Str"
}

// MARK: - ScalesWith
struct ScalesWith: Codable {
    let name: ScalesWithName
    let scaling: Scaling?
}

enum ScalesWithName: String, Codable {
    case arc = "Arc"
    case dex = "Dex"
    case empty = "-"
    case fai = "Fai"
    case int = "Int"
    case name = ""
    case str = "Str"
}

enum Scaling: String, Codable {
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
    case e = "E"
    case empty = "?"
    case scaling = "-"
}
