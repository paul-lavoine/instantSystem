//
//  FeedsCoordinator.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation

class FeedsCoordinator: BaseCoordinator {
    // MARK: - Constructors
    init(with feedsController: FeedsController, router: Router) {

        super.init(feedsController: feedsController, router: router)
    }

    // MARK: - Coordinator life cycle
    override func start() {
        let feeds = FeedsViewController(with: feedsController)

        router.push(feeds) {
            self.executeCompletion()
        }
    }

    // MARK: - Navigation
    func showDetail() {
        let coordinator = FeedsCoordinator(with: feedsController, router: router)
        coordinator.onComplete = buildAutoRemoveBlock(for: coordinator)

        add(coordinator)
        coordinator.start()
    }
}
