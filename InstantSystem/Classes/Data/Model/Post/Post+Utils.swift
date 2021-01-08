//
//  Post+Utils.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 07/01/2021.
//

import Foundation

extension Post {
    
    // MARK: - Utils
    func imageUrl() -> URL? {
        if let imageUrl = URL(string: image.url) {
            return imageUrl
        }

        return nil
    }
}
