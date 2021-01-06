//
//  IntroductionViewModel.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

class IntroductionViewModel {
    
    // MARK: - Properties
    private var coordinator: IntroductionCoordinator
    
    // MARK: - Constructor
    init(with coordinator: IntroductionCoordinator) {
        self.coordinator     = coordinator
    }
    
    // MARK: - Navigation
    func showFeed() {
        coordinator.showFeed()
    }
}
