//
//  FeedCoordinator.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

class FeedCoordinator: BaseCoordinator {
    
    // MARK: - Constructors
    init(with feedController: FeedController, router: Router) {
        super.init(feedController: feedController, router: router)
    }

    // MARK: - Coordinator life cycle
    override func start() {
        let feed = FeedViewController(with: self, feedController: feedController)

        router.push(feed) {
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
