//
//  ViewController.swift
//  BullsEye
//
//  Copyright © 2017 pxlhrtbrkr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    var current_value : Int = 0
    var targetValue : Int = 0
    var score : Int = 0
    var round : Int = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        current_value = Int(slider.value) // This is for the very first time only I guess,t
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound(){
        //generate a new random number
        targetValue = getRandomNumber()
        current_value = 50
        slider.value = Float(current_value)
    }
    
    func getRandomNumber() -> Int {
        return Int(arc4random_uniform(100)+1)
    }
    @IBAction func SliderMoved(_ slider: UISlider) {
        current_value = Int(slider.value)
        print("The slider value is \(current_value)")

    }
    
    @IBAction func showAlert(){
        var alert_message : String = "You slided upto ... \(current_value)" + "\n" + "The target Value is \(targetValue)"
        let alert = UIAlertController(title: "Hello World", message: alert_message , preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default , handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
}

