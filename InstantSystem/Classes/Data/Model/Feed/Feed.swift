//
//  FeedPOSO.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

struct Feed: Codable {
    
    let uid: String
    let title: String
    let posts: [Post]
    let icon: String
    let logo: String
    let subtitle: String
    
    enum CodingKeys: String, CodingKey {
        case title, icon, logo, subtitle
        case uid = "id"
        case posts = "entry"
    }
}
