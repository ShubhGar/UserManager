//
//  UIViewController+Extension.swift
//  MyApplication
//
//  Created by Shubham Garg on 30/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static var vcIdentifier: String {
        return String(describing: Self.self)
    }
    
    public func add(asChildViewController viewController: UIViewController,to parentView:UIView) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        self.add(viewController.view, to: parentView)
        
        // Configure Child View
//        viewController.view.frame = parentView.bounds
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    func add(_ subView:UIView, to parentView:UIView) {
        parentView.addSubview(subView)
        //        self.view.addSubview(parentView)
        // Configure Child View.
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        
        
    }
    
    public func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
}
