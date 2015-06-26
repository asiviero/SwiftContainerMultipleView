//
//  ContainerMultipleViewController.swift
//  ContainerMultipleView
//
//  Created by Andre Siviero on 26/06/15.
//  Copyright (c) 2015 asiviero. All rights reserved.
//

import Foundation
import UIKit

class ContainerMultipleViewController : UIViewController {
    
    let segue_red = "segue_red"
    let segue_green = "segue_green"
    let segue_black = "segue_black"
    
    var view_controller_red:UIViewController?
    var view_controller_green:UIViewController?
    var view_controller_black:UIViewController?
    
    var current_segue_identifier:String?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        current_segue_identifier = segue_red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegueWithIdentifier(segue_red, sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == segue_red {
            view_controller_red = (segue.destinationViewController as! UIViewController)
            // Check if a controller is already set
            if self.childViewControllers.count > 0 {
                swapFromViewController(childViewControllers.first as! UIViewController, to_view_controller: view_controller_red!)
            }
            else {
                self.addChildViewController(segue.destinationViewController as! UIViewController)
                
                var destination_view = segue.destinationViewController.view as UIView!
                destination_view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
                destination_view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                
                self.view.addSubview(destination_view)
                segue.destinationViewController.didMoveToParentViewController(self)
            }
        }
        
        if segue.identifier == segue_green {
            view_controller_green = (segue.destinationViewController as! UIViewController)
            swapFromViewController(childViewControllers.first as! UIViewController, to_view_controller: view_controller_green!)
        }
        
        if segue.identifier == segue_black {
            view_controller_black = (segue.destinationViewController as! UIViewController)
            swapFromViewController(childViewControllers.first as! UIViewController, to_view_controller: view_controller_black!)
        }
    }
    
    func swapFromViewController(from_view_controller : UIViewController, to_view_controller : UIViewController) {
        
        to_view_controller.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        to_view_controller.view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        from_view_controller.willMoveToParentViewController(nil)
        self.addChildViewController(to_view_controller)
        
        self.transitionFromViewController(from_view_controller, toViewController: to_view_controller, duration: 0.1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: nil,
            completion: {finished in
                from_view_controller.removeFromParentViewController()
                to_view_controller.didMoveToParentViewController(self)
        })
        
    }
}