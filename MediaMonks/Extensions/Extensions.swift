//
//  Extensions.swift
//  MediaMonks
//
//  Created by Anup Gupta on 10/05/21.
//

import Foundation
import UIKit
extension UIViewController {
    
    func showToastAndDisableUserInteraction() {
        self.view.makeToastActivity(.center)
        self.view.isUserInteractionEnabled = false
    }
    
    func hideToastAndEnableUserInteraction() {
        self.view.hideToastActivity()
        self.view.isUserInteractionEnabled = true
        
    }
    
}



extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font ?? 11], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}
