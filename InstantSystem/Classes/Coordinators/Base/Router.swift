//
//  Router.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation
import UIKit

class Router: NSObject {
    // MARK: - Properties
    private let navigationController: UINavigationController
    private var completionBlocks = [UIViewController: SimpleCompletionBlock]()

    // MARK: - Constructors
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController

        super.init()
        self.navigationController.delegate = self
    }

    func dismiss(animated: Bool = true) {
        navigationController.dismiss(animated: animated)
    }

    /// Pop last view controller
    /// If a controller is set, will pop this controller and all stacked controller after it
    func pop(_ presentable: Presentable, animated: Bool = true) {
        guard let index = navigationController.viewControllers.firstIndex(of: presentable.controllerToPresent()) else {
            return // View controller already poped
        }

        let viewControllers: [UIViewController]
        if index > 0 {
            viewControllers = Array(navigationController.viewControllers[0...index-1])
        } else {
            viewControllers = []
        }

        navigationController.setViewControllers(viewControllers, animated: animated)
    }

    /// Push a new presentable to stack
    func push(_ presentable: Presentable, animated: Bool = true, completionBlock: SimpleCompletionBlock? = nil) {
        let viewController = presentable.controllerToPresent()

        // Hold completion block
        if let completionBlock = completionBlock {
            completionBlocks[viewController] = completionBlock
        }

        navigationController.pushViewController(viewController, animated: animated)
    }

    func present(_ presentable: Presentable, animated: Bool = true) {
        navigationController.present(presentable.controllerToPresent(), animated: animated)
    }

    func rootViewController() -> UIViewController {
        return navigationController
    }

    // MARK: - Utils
    private func executeCompletion(for viewController: UIViewController) {
        // Check if a completion block is available, and execute it
        if let completionBlock = completionBlocks[viewController] {
            completionBlock()
            completionBlocks[viewController] = nil
        }
    }
}

// MARK: - UINavigationControllerDelegate
extension Router: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        // Extract origin view controller if available
        guard let originViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Detect if we are pushing or popping
        if navigationController.contains(originViewController) {
            return // We are pushing a view controller
        }

        executeCompletion(for: originViewController)
    }
}
