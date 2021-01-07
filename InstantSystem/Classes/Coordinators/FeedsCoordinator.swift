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
        let feeds = FeedsViewController(with: self, feedsController: feedsController)

        router.push(feeds) {
            self.executeCompletion()
        }
    }

    // MARK: - Navigation
    func show(_ post: Post) {
        let post = PostViewController(with: self, post: post)

        router.push(post) {
            self.executeCompletion()
        }
    }
}
