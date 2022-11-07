//
//  Shields.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/shields

import Foundation

// MARK: - Shields
struct Shields: Codable {
    let success: Bool
    let count, total: Int
    let data: [Shield]
}

// MARK: - Shield
struct Shield: Codable {
    let id, name: String
    let image: String?
    let datumDescription: String
    let attack, defence: [AttackShield]
    let scalesWith: [ScalesWithShield]
    let requiredAttributes: [AttackShield]
    let category: CategoryShield?
    let weight: Double

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case attack, defence, scalesWith, requiredAttributes, category, weight
    }
}

// MARK: - Attack
struct AttackShield: Codable {
    let name: String
    let amount: Int?
}

enum CategoryShield: String, Codable {
    case greatshield = "Greatshield"
    case mediumShield = "Medium Shield"
    case smallShield = "Small Shield"
    case smallShields = "Small Shields"
}

// MARK: - ScalesWith
struct ScalesWithShield: Codable {
    let name: NameShield
    let scaling: ScalingShield?
}

enum NameShield: String, Codable {
    case dex = "Dex"
    case empty = ""
    case fai = "Fai"
    case int = "Int"
    case nameINT = "INT"
    case nameSTR = "STR"
    case str = "Str"
    case strength = "Strength"
}

enum ScalingShield: String, Codable {
    case d = "D"
    case e = "E"
    case empty = ""
    case purple = "-"
    case scaling = "?"
}
