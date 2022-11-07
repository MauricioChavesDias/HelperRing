//
//  Creatures.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///

import Foundation

// MARK: - Creatures
struct Creatures: Codable {
    let success: Bool
    let count, total: Int
    let data: [Creature]
}

// MARK: - Creature
struct Creature: Codable {
    let id, name: String
    let image: String?
    let datumDescription: String?
    let location: String?
    let drops: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case location, drops
    }
}

