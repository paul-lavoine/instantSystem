//
//  Animations.swift
//  InstantSystem
//
//  Created by Paul_Lavoine on 05/01/2021.
//

import Lottie

/// List all animations available in application for Lottie
enum Animations: String {
    case loader, search, logo

    // MARK: - Utils
    /// Load associated animation
    func loadAnimation() -> Animation {
        guard let animation = Animation.named(self.rawValue) else {
            fatalError("Cannot find animation file <\(self.rawValue)")
        }

        return animation
    }

    func loopMode() -> LottieLoopMode {
        self == .search ? LottieLoopMode.playOnce : LottieLoopMode.loop
    }
}
