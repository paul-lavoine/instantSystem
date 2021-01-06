//
//  Link.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 06/01/2021.
//

import Foundation

struct Link: Codable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "href"
    }
}
