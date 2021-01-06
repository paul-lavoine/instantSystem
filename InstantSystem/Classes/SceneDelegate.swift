//
//  SceneDelegate.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var applicationCoordinator: ApplicationCoordinator!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Check if window is set
        guard let scene = scene as? UIWindowScene else {
            fatalError("Expecting scene type to be UIWindowScene")
        }

        // Create window attached to scene
        window = UIWindow(windowScene: scene)
        guard let window = window else {
            fatalError("Cannot instantiate window")
        }
        
        // Root navigation controller
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true

        // Init data
        let feedsController  = FeedsController()
        feedsController.fetchFeed { (_) in } failure: {}
        let router           = Router(navigationController: navigationController)
        
        applicationCoordinator = ApplicationCoordinator(window: window, router: router, feedsController: feedsController)
        applicationCoordinator.start()

        window.rootViewController = router.rootViewController()
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

