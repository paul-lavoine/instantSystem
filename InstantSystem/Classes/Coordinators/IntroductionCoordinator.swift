//
//  IntroductionCoordinator.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

class IntroductionCoordinator: BaseCoordinator {

    // MARK: - Constructors
    init(with feedController: FeedController, router: Router) {
        super.init(feedController: feedController, router: router)
    }

    // MARK: - Coordinator life cycle
    override func start() {
        let intro = IntroductionViewController(with: self, feedController: feedController)

        router.push(intro) {
            self.executeCompletion()
        }
    }

    // MARK: - Navigation
    func showFeed() {
        let coordinator = FeedCoordinator(with: feedController, router: router)
        coordinator.onComplete = buildAutoRemoveBlock(for: coordinator)

        add(coordinator)
        coordinator.start()
    }
}
