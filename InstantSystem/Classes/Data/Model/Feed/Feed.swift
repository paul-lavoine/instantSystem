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
    
    enum CodingKeys: String, CodingKey {
        case title
        case uid = "id"
        case posts = "entry"
    }
}
