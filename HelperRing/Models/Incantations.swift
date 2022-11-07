//
//  Incantations.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/incantations

import Foundation

// MARK: - Incantations
struct Incantations: Codable {
    let success: Bool
    let count, total: Int
    let data: [Incantation]
}

// MARK: - Incantation
struct Incantation: Codable {
    let id, name: String
    let image: String?
    let datumDescription: String
    let type: TypeIncantation
    let cost, slots: Int
    let effects: String?
    let requires: [RequireAttributes]?

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case type, cost, slots, effects, requires
    }
}

// MARK: - Require
struct RequireAttributes: Codable {
    let name: NameAttribute
    let amount: Int
}

enum NameAttribute: String, Codable {
    case arcane = "Arcane"
    case faith = "Faith"
    case intelligence = "Intelligence"
}

enum TypeIncantation: String, Codable {
    case incantation = "Incantation"
    case incantations = "Incantations"
}
