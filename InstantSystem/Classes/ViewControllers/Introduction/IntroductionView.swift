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
    @IBOutlet private (set) weak var supportView: UIView!
    @IBOutlet private (set) weak var startButton: UIButton!
    @IBOutlet private (set) weak var logoTitleImage: UIImageView!
    @IBOutlet private (set) weak var networkIndicator: UIActivityIndicatorView!
    
    // MARK: UI Components
    private var animationView: AnimationView!
    
    // MARK: - Callbacks
    var displayFeedRequested: SimpleCompletionBlock?
    
    // MARK: - View life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        logoTitleImage.image = R.image.logo_is()
        configureStartButton()
        configureAnimation()
        startAnimation()
    }
    
    // MARK: - Configure UI
    func configureStartButton() {
        startButton.setTitle("", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.layer.cornerRadius       = startButton.frame.height / 2
        startButton.layer.borderWidth        = 1.0
        startButton.layer.borderColor        = UIColor.black.cgColor
        startButton.isUserInteractionEnabled = false
        
        let layer = gradient(view: startButton)
        startButton.layer.insertSublayer(layer, at: 0)
    }
    
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
    }
    
    // MARK: - Utils
    func startAnimation() {
        animationView.play()
    }
    
    func gradient(view: UIView) -> CAGradientLayer {
        let layer          = CAGradientLayer()
        layer.frame        = view.bounds
        layer.colors       = [UIColor(red: 213.0/255.0, green: 55.0/255.0, blue: 113.0/255.0, alpha: 1).cgColor,
                              UIColor(red: 68.0/255.0, green: 66.0/255.0, blue: 121.0/255.0, alpha: 1).cgColor]
        layer.startPoint   = CGPoint(x: 0, y: 1)
        layer.endPoint     = CGPoint(x: 0, y: 0.1)
        layer.cornerRadius = view.frame.height / 2
        
        return layer
    }
    
    // MARK: - Notification
    func dataDidLoad() {
        /// Stop indicator
        networkIndicator.stopAnimating()
        
        /// Update button layout
        startButton.setTitle(R.string.localizable.introductionViewControllerContinueButton(), for: .normal)
        startButton.isUserInteractionEnabled = true
    }
    
    // MARK: - Actions
    @IBAction func displayFeedAction(_ sender: Any) {
        if let displayFeedRequested = displayFeedRequested {
            displayFeedRequested()
        }
    }
}
