//
//  BaseCoordinator.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit

class BaseCoordinator: Coordinator {
    
    // MARK: - Properties
    let feedsController: FeedsController
    let router: Router
    let rootViewController: UIViewController
    private var uid = UUID()
    private var childrenCoordinators = [UUID: BaseCoordinator]()

    var onComplete: SimpleCompletionBlock? // Callback to execute on coordinator completion

    // MARK: - Constructors
    init(feedsController: FeedsController, router: Router) {
        self.feedsController = feedsController
        self.router = router
        self.rootViewController = router.rootViewController()
    }

    // MARK: - Life cycle
    /// Start current coordinator
    func start() {}

    func stop() {
        childrenCoordinators.forEach { _, child in
            child.stop()
        }
    }

    // MARK: - Children management
    func add(_ child: BaseCoordinator) {
        childrenCoordinators[child.uid] = child
    }

    func remove(_ child: BaseCoordinator) {
        childrenCoordinators[child.uid] = nil
    }

    // MARK: - Utils
    final func executeCompletion() {
        if let onComplete = onComplete {
            onComplete()

            // Ensure completion block is executed only once
            self.onComplete = nil
        }
    }

    /// Generate a block for given coordinator to be removed from his parent on completion
    final func buildAutoRemoveBlock(for coordinator: BaseCoordinator) -> SimpleCompletionBlock {
        return { [weak self, weak coordinator] in
            guard let coordinator = coordinator else {
                return
            }

            self?.remove(coordinator)
        }
    }
}
