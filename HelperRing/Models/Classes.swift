//
//  Classes.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/classes

import Foundation

// MARK: - Classes
struct Classes: Codable {
    let success: Bool
    let count, total: Int
    let data: [Classe]
}

// MARK: - Classe
struct Classe: Codable {
    let id, name: String
    let image: String
    let datumDescription: String
    let stats: Stats

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case stats
    }
}

// MARK: - Stats
struct Stats: Codable {
    let level, vigor, mind, endurance: String
    let strength, dexterity, intelligence, faith: String
    let arcane: String
}
