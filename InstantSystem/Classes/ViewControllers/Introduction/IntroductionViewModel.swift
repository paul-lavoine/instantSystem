//
//  IntroductionViewModel.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

class IntroductionViewModel {
    
    // MARK: - Properties
    private var coordinator: IntroductionCoordinator
    var bindIntroductionViewModelToController : (() -> ()) = {}
    
    // MARK: - Constructor
    init(with coordinator: IntroductionCoordinator, feedsController: FeedsController) {
        self.coordinator = coordinator
        
        /// Fetch data
        feedsController.fetchFeed { [weak self] (_) in
            self?.bindIntroductionViewModelToController()
        } failure: {
            
        }
    }
    
    // MARK: - Navigation
    func showFeed() {
        coordinator.showFeed()
    }
}
