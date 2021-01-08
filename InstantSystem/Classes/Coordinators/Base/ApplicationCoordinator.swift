//
//  ApplicationCoordinator.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit

class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    fileprivate let window: UIWindow

    // MARK: - Constructors
    init(window: UIWindow, router: Router, feedController: FeedController) {
        self.window = window
        
        super.init(feedController: feedController, router: router)
    }

    // MARK: - Coordinator life cycle
    override func start() {
        let coordinator = IntroductionCoordinator(with: feedController, router: router)
        add(coordinator)

        coordinator.start()
    }
}
