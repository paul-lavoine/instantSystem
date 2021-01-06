//
//  Dismissable.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation
import UIKit

protocol Dismissable where Self: UIViewController {
    
    // MARK: - Callbacks
    /// Block called once controller is dismissed
    var onDismissed: SimpleCompletionBlock? {get set}
}

extension Dismissable {
    // MARK: - Utils
    func executeDismissed() {
        if let onDismissed = onDismissed {
            onDismissed()
        }
    }
}
