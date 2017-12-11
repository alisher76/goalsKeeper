//
//  Gradient.swift
//  GoalsKeeper
//
//  Created by Alisher Abdukarimov on 12/10/17.
//  Copyright © 2017 Alisher Abdukarimov. All rights reserved.
//

import UIKit

// able to work in sotryboard
@IBDesignable
class GradientView: UIView {
    
    // dynamicallky change
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.007843137255, green: 0.6666666667, blue: 0.6901960784, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    // dynamicallky change
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0, green: 0.8039215686, blue: 0.6745098039, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        // we need color, needs starting and end point, how big shape will it be filling
        
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        // x origin top left 0, ... positive to the right
        // y origin top left 0 ... negative to the bottom
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
