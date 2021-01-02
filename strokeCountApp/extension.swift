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

extension String {
    
    enum ValidityType {
        case alphanumeric
    }
    
    enum invalidMessage: String {
        case fullWidthCharacter = "スペース・全角文字が含まれています"
        case overStringCount = "最大文字数を超えています"
        case none = ""
    }
    
    enum Regex: String {
        case alphanumeric = "[!-~]{1,99}"
    }
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
        case .alphanumeric:
            regex = Regex.alphanumeric.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}

extension UIImage {
    func resize(size _size: CGSize) -> UIImage? {
        
        let resizedSize = CGSize(width: size.width, height: size.height)

        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0) // 変更
        draw(in: CGRect(origin: .zero, size: resizedSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return resizedImage
    }
}


