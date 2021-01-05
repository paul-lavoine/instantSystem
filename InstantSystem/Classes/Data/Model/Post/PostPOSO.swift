//
//  PostPOSO.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation

struct PostPOSO: Codable {
    let uid: Int64
    let title, body: String
    let date: Date  // Use ISO8601DateFormatter for date
    let image: String

    enum CodingKeys: String, CodingKey {
        case date, title, body
        case uid = "id"
        case image = "imageUrl"
    }
}
