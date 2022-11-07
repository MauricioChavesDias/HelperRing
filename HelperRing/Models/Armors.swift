//
//  Armors.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/armors


// MARK: - Armors
struct Armors: Codable {
    let success: Bool
    let count, total: Int
    let data: [Armor]
}

// MARK: - Armor
struct Armor: Codable {
    let id, name: String
    let image: String?
    let datumDescription: String
    let category: Category
    let dmgNegation, resistance: [DmgNegation]
    let weight: Double

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case category, dmgNegation, resistance, weight
    }
}

enum Category: String, Codable {
    case chestArmor = "Chest Armor"
    case gauntlets = "Gauntlets"
    case helm = "Helm"
    case legArmor = "Leg Armor"
}

// MARK: - DmgNegation
struct DmgNegation: Codable {
    let name: NameNegation
    let amount: Double
}

enum NameNegation: String, Codable {
    case empty = ""
    case fire = "Fire"
    case focus = "Focus"
    case holy = "Holy"
    case immunity = "Immunity"
    case light = "Light"
    case ligt = "Ligt"
    case mag = "Mag"
    case magic = "Magic"
    case phy = "Phy"
    case pierce = "Pierce"
    case poise = "Poise"
    case pose = "Pose"
    case robustness = "Robustness"
    case slash = "Slash"
    case strike = "Strike"
    case the61 = "6.1"
    case vitality = "Vitality"
}
