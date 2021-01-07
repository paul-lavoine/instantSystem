//
//  PostView.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import UIKit
import SDWebImage

class PostView: UIView, UITextViewDelegate {
    
    // MARK: - Properties
    private var imageRatio: CGFloat = 0
    
    // MARK: - Outlets
    @IBOutlet private (set) weak var postImageView: UIImageView!
    @IBOutlet private (set) weak var titleLabel: UILabel!
    @IBOutlet private (set) weak var descriptionLabel: UILabel!
    @IBOutlet private (set) weak var linkTextView: UITextView!
    @IBOutlet private (set) weak var contentView: UIView!
    
    // MARK: - Constants
    @IBOutlet private (set) weak var heightImageConstraint: NSLayoutConstraint!
        
    // MARK: - View life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /// Refresh layout
        postImageView.layoutIfNeeded()
        
        /// Compute height
        heightImageConstraint.constant = imageRatio * postImageView.frame.width
    }
    
    // MARK: - Configuration
    func configure(with post: Post) {
        /// title
        titleLabel.text = post.title
        
        /// description
        descriptionLabel.text = post.content
        
        /// image
        imageRatio = CGFloat(post.image.height / post.image.width)
        postImageView.sd_setImage(with: post.imageUrl(), completed: nil)
        
        /// link
        let url = post.link.url
        let attributedString = NSMutableAttributedString(string: url)
        attributedString.addAttribute(.link, value: url, range: NSRange(location: 0, length: url.count))
        linkTextView.attributedText = attributedString
    }
}
