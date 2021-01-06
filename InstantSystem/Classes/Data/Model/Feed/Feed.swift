//
//  FeedPOSO.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation

struct Feed: Codable {
    
    let uid: String
    let title: String
    let post: [Post]?
    let icon: String
    let logo: String
    let subtitle: String
    
    enum CodingKeys: String, CodingKey {
        case title, icon, logo, subtitle
        case uid = "id"
        case post = "entry"
    }
}
