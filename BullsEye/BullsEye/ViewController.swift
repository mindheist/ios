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
    @IBOutlet weak var score_label: UILabel!
    
    var current_value = 0
    var target_value = 0
    var difference = 0
    var total_score = 0
    var round_points = 0
    var round_value = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        current_value = lroundf(slider.value) // This is for the very first time only I guess,t
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ThumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let ThumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(ThumbImageNormal, for: .normal)
        slider.setThumbImage(ThumbImageHighlighted, for: .highlighted)
        
        let sliderLeftTrack = #imageLiteral(resourceName: "SliderTrackLeft")
        let sliderRightTrack = #imageLiteral(resourceName: "SliderTrackRight")
        slider.setMaximumTrackImage(#imageLiteral(resourceName: "SliderTrackLeft"), for: .normal)
        slider.setMaximumTrackImage(#imageLiteral(resourceName: "SliderTrackRight"), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startover(){
        total_score = 0
        round_value = 0
        startNewRound()
    }
    
     func startNewRound(){
        round_value = round_value + 1 // not sure where to increment the round variable. This seems to get increment even before the user dismisses the alert
        //generate a new random number
        target_value = getRandomNumber()
        
        current_value = 50
        slider.value = Float(current_value)
        update_all_labels()

    }
    func update_all_labels(){
        target_label.text = String(target_value)
        round_label.text = String(round_value)
        score_label.text = String(total_score)
        
    }
    func getRandomNumber() -> Int {
        return Int(arc4random_uniform(100)+1)
    }
    @IBAction func SliderMoved(_ slider: UISlider) {
        current_value = lroundf(slider.value)
        print("The slider value is \(current_value)")

    }
    
    @IBAction func showAlert(){
        difference = abs(target_value - current_value)
        
        let title: String
        if difference == target_value {
            title = "Perfect"
            round_points += 100
        }
        else if difference < 5 {
            title = "Pretty Close"
        }
        else if difference < 10 {
            title = "You almost had it"
        }
        else {
             title = "Not even close"
        }
        round_points = 100 - difference
        total_score += round_points
        var alert_message : String = "You scored \(round_points) points"
        let alert = UIAlertController(title: title, message: alert_message , preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default , handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

