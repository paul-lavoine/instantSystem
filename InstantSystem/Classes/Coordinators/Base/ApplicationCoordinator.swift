//
//  ApplicationCoordinator.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Foundation
import UIKit

class ApplicationCoordinator: BaseCoordinator {
    // MARK: - Properties
    fileprivate let window: UIWindow

    // MARK: - Constructors
    init(window: UIWindow, router: Router, feedsController: FeedsController) {
        self.window = window
        
        super.init(feedsController: feedsController, router: router)
    }

    // MARK: - Coordinator life cycle
    override func start() {
        let coordinator = IntroductionCoordinator(with: feedsController, router: router)
        add(coordinator)

        coordinator.start()
    }
}
