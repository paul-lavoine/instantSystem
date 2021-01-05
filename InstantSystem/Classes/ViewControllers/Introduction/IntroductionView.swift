//
//  IntroductionView.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit
import Lottie
import SnapKit

class IntroductionView: UIView {
    // MARK: - Outlets
    @IBOutlet private (set) weak var startButton: UIButton!
    @IBOutlet private (set) weak var supportView: UIView!
    
    // MARK: UI Components
    private var animationView: AnimationView!
    
    // MARK: - View life cycle
    override func awakeFromNib() {
        super.awakeFromNib()

        configureAnimation()
        
        startButton.setTitle(R.string.localizable.introductionViewControllerContinueButton(),
                             for: .normal)
    }
    
    // MARK: - Animation
    fileprivate func configureAnimation() {
        
        /// Configure animation properties
        let animation: Animations = .logo
        animationView             = AnimationView()
        animationView.contentMode = .scaleAspectFit
        animationView.animation   = animation.loadAnimation()
        animationView.loopMode    = animation.loopMode()
        
        /// Configure animation layout
        animationView.frame = supportView.frame
        supportView.addSubview(animationView)
        
        animationView.snp.makeConstraints { (make) in
            make.edges.equalTo(supportView)
        }
        
        /// Start animation
        animationView.play()
    }
}
