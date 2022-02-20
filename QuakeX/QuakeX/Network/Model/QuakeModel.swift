//
//  QuakeModel.swift
//  QuakeX
//
//  Created by Furkan Hanci on 1/24/22.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: Bool
    let result: [MainModel]
}

// MARK: - Result
struct MainModel: Codable {
    let lng, lat , mag: Double
    let lokasyon: String
    let depth: Double
    let coordinates: [Double]
    let title: String
    let timestamp: Int
    let dateStamp, date, hash, hash2: String

    enum CodingKeys: String, CodingKey {
        case mag, lng, lat, lokasyon, depth, coordinates, title, timestamp
        case dateStamp = "date_stamp"
        case date, hash, hash2
    }
}


