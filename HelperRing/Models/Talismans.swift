//
//  Talismans.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/talismans

import Foundation

// MARK: - Talismans
struct Talismans: Codable {
    let success: Bool
    let count, total: Int
    let data: [Talisman]
}

// MARK: - Talisman
struct Talisman: Codable {
    let id, name: String
    let image: String
    let datumDescription, effect: String

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case effect
    }
}
