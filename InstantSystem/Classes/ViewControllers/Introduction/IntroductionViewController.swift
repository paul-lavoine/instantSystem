//
//  ViewController.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    // MARK: - Properties
    private var feedsController: FeedsController
    private var introductionViewModel: IntroductionViewModel
    
    // MARK: - Constructors
    required init(with coordinator: IntroductionCoordinator, feedsController: FeedsController) {
        self.feedsController       = feedsController
        self.introductionViewModel = IntroductionViewModel(with: coordinator)
        
        super.init(nibName: R.nib.introductionViewController.name, bundle: R.nib.introductionViewController.bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = introductionView()
        view.displayFeedRequested = { [weak self] in
            self?.introductionViewModel.showFeed()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        introductionView().startAnimation()
    }
    
    // MARK: - Utils
    private func introductionView() -> IntroductionView {
        guard let introductionView = view as? IntroductionView else {
            fatalError("<\(type(of: self.view))> found instead of expected IntroductionView")
        }

        return introductionView
    }
}
