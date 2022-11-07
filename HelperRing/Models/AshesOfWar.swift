//
//  AshesOfWar.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/ashes


import Foundation

// MARK: - AshesOfWar
struct AshesOfWar: Codable {
    let success: Bool
    let count, total: Int
    let data: [AshOfWar]
}

// MARK: - AshOfWar
struct AshOfWar: Codable {
    let id, name: String
    let image: String
    let datumDescription, affinity, skill: String

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case affinity, skill
    }
}
