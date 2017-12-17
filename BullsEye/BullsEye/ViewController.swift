//
//  ViewController.swift
//  BullsEye
//
//  Copyright © 2017 pxlhrtbrkr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var target_label: UILabel!
    @IBOutlet weak var round_label: UILabel!
    
    var current_value : Int = 0
    var target_value : Int = 0
    var difference : Int = 0
    var score : Int = 0
    var round_value : Int = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        current_value = lroundf(slider.value) // This is for the very first time only I guess,t
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound(){
        //generate a new random number
        target_value = getRandomNumber()
        target_label.text = String(target_value)
        round_label.text = String(round_value)
        current_value = 50
        slider.value = Float(current_value)

    }
    
    func getRandomNumber() -> Int {
        return Int(arc4random_uniform(100)+1)
    }
    @IBAction func SliderMoved(_ slider: UISlider) {
        current_value = lroundf(slider.value)
        print("The slider value is \(current_value)")

    }
    
    @IBAction func showAlert(){
        if Float(current_value) == Float(target_value){
            var alert_message : String = "Bingo ! That was Spot on"
        }
        else if target_value > current_value{
            difference = target_value - current_value
        }
        else if current_value > target_value{
            difference = current_value - target_value
        }
        
        var alert_message : String = "You slided upto ... \(current_value) and" + " the target Value is \(target_value)" + "\n" + "That was close, you missed it by \(difference)"
        let alert = UIAlertController(title: "Hello World", message: alert_message , preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default , handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        round_value = round_value + 1 // not sure where to increment the round variable. This seems to get increment even before the user dismisses the alert

    }
    
}

