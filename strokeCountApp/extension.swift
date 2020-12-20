//
//  extension.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/20.
//  Copyright © 2020 nararyo. All rights reserved.
//

import Foundation
import UIKit

enum FadeType: TimeInterval {
    case
    Normal = 0.2,
    Slow = 1.5
}

extension UIView {
   func fadeIn(type: FadeType = .Normal, completed: (() -> ())? = nil) {
        fadeIn(duration: type.rawValue, completed: completed)
    }

    /** For typical purpose, use "public func fadeIn(type: FadeType = .Normal, completed: (() -> ())? = nil)" instead of this */
   func fadeIn(duration: TimeInterval = FadeType.Slow.rawValue, completed: (() -> ())? = nil) {
        alpha = 0
        isHidden = false
    UIView.animate(withDuration: duration, delay: 0.6,
            animations: {
                self.alpha = 1
            }) { finished in
                completed?()
        }
    }
}
