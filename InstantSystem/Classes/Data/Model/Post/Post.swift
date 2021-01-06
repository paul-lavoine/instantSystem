//
//  PostPOSO.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation

struct Post: Codable {
    
    let title: String
    let updated: Date
    let summary: String
    let content: String
    let author: Author
    let link: Link
    let image: Image
    
    enum CodingKeys: String, CodingKey {
        case title, updated, summary, content, author, link
        case image = "media:content"
    }
}
