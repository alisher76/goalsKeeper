//
//  UIViewControllerExt.swift
//  GoalsKeeper
//
//  Created by Alisher Abdukarimov on 12/11/17.
//  Copyright © 2017 Alisher Abdukarimov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // Overriding default Present Detail method
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        
        let transition = CATransition()
        // We need to give duration
        transition.duration = 0.3
        // Type of an Animation
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        // Set a layer
        self.view.window?.layer.add(transition, forKey: kCATransition)
        // Animation in present method will be set to false to avoid default animation
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail(_ viewControllerToPresent: UIViewController) {
        
        let transition = CATransition()
        // We need to give duration
        transition.duration = 0.3
        // Type of an Animation
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        // Set a layer
        self.view.window?.layer.add(transition, forKey: kCATransition)
        // Animation in present method will be set to false to avoid default animation
        dismiss(animated: false, completion: nil)
    }
    
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        // We need to give duration
        transition.duration = 0.3
        // Type of an Animation
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        guard let presentedVC = presentedViewController else { return }
        presentedVC.dismiss(animated: false, completion: {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        })
        
    }
    
}
