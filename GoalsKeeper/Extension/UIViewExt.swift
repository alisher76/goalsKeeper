//
//  UIViewExt.swift
//  GoalsKeeper
//
//  Created by Alisher Abdukarimov on 12/11/17.
//  Copyright © 2017 Alisher Abdukarimov. All rights reserved.
//

import UIKit


extension UIView {
    
    func bindKeyboard()  {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        // Every animation has a curve we will access it
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        // Capture the frame
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            
            self.frame.origin.y += deltaY
            
        }, completion: nil)
    }
}
