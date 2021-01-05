//
//  Presentable.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation
import UIKit

/// Implement this protocol to expose view controllers to be presented
protocol Presentable {
    /// Return view controller to be presented
    func controllerToPresent() -> UIViewController
}

// MARK: - UIViewController
extension UIViewController: Presentable {
    func controllerToPresent() -> UIViewController {
        return self
    }
}
