//
//  ViewController.swift
//  hayday1
//
//  Copyright © 2017 pxlhrtbrkr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func show_remaining_time(){
        print("Hello, you just tried to harvest this patch")
    }
    
    @IBAction func clicked_on_barn(){
        print ("You clicked on the barn,This should show all the Barn contents as a modal")
    }
    
    @IBAction func clicked_on_silo(){
        print ("You clicked on the Silo,This should show all Silo contents as a modal")
    }
    
    @IBAction func clicked_on_the_farmhouse(){
        print ("This should show the list of all achievements as a modal")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

