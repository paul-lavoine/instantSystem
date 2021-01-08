//
//  UITableView+Component.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 06/01/2021.
//

import UIKit

/// Base class for all cells in application
/// Will expose utis methods to automatically retrieve reuseId and nib file
extension UITableViewCell {
    
    // MARK: - Utils
    private class var simpleClassName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static func reuseIdentifier() -> String {
        return simpleClassName
    }

    static func nib(bundle: Bundle = Bundle.main) -> UINib {
        UINib(nibName: simpleClassName, bundle: bundle)
    }
}

