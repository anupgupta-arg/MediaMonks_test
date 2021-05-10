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
