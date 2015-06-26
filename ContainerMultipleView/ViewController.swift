//
//  ViewController.swift
//  ContainerMultipleView
//
//  Created by Andre Siviero on 26/06/15.
//  Copyright (c) 2015 asiviero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var container_view_controller: ContainerMultipleViewController?

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue_embed_container" {
            container_view_controller = segue.destinationViewController as? ContainerMultipleViewController
        }
    }
    
    @IBOutlet weak var container_view: UIView!

    @IBAction func red_clicked(sender: UIButton) {
        container_view_controller?.performSegueWithIdentifier("segue_red", sender: nil)
    }
    
    @IBAction func green_clicked(sender: UIButton) {
        container_view_controller?.performSegueWithIdentifier("segue_green", sender: nil)
    }
    
    @IBAction func black_clicked(sender: UIButton) {
        container_view_controller?.performSegueWithIdentifier("segue_black", sender: nil)
    }
}

