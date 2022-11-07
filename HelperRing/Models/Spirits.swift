//
//  Spirits.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/spirits

import Foundation

// MARK: - Spirits
struct Spirits: Codable {
    let success: Bool
    let count, total: Int
    let data: [Spirit]
}

// MARK: - Spirit
struct Spirit: Codable {
    let id, name: String
    let image: String?
    let datumDescription, fpCost, hpCost, effect: String

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case datumDescription = "description"
        case fpCost, hpCost, effect
    }
}
