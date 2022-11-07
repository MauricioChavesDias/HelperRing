//
//  Sorceries.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/sorceries

import Foundation

// MARK: - Sorceries
struct Sorceries: Codable {
    let success: Bool
    let count, total: Int
    let data: [Sorcery]
}

// MARK: - Sorcery
struct Sorcery: Codable {
    let id, name: String
    let image: String?
    let datumDescription: String
    let type: TypeEnumSorcery
    let cost, slots: Int
    let effects: String
    let requires: [RequireSorceryAttributes]

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case type, cost, slots, effects, requires
    }
}

// MARK: - Require
struct RequireSorceryAttributes: Codable {
    let name: NameRequireAttribute
    let amount: Int
}

enum NameRequireAttribute: String, Codable {
    case arcane = "Arcane"
    case faith = "Faith"
    case intelligence = "Intelligence"
}

enum TypeEnumSorcery: String, Codable {
    case sorceries = "Sorceries"
    case sorcery = "Sorcery"
}
