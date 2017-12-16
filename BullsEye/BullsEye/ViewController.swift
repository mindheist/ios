//
//  ViewController.swift
//  BullsEye
//
//  Copyright © 2017 pxlhrtbrkr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var slider_variable : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SliderMoved(_ slider: UISlider) {
        
        slider_variable = Int(slider.value)
        print("The slider value is \(slider_variable)")

    }
    
    @IBAction func showAlert(){
        var alert_message : String = "The slider value is \(slider_variable)"
        let alert = UIAlertController(title: "Hello World", message: alert_message , preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default , handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

