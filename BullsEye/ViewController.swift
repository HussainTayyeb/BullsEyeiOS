//
//  ViewController.swift
//  BullsEye
//
//  Created by Tayyeb Hussain on 11.02.19.
//  Copyright © 2019 Tayyeb Hussain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue : Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tscore: UILabel!
    @IBOutlet weak var NumberRound: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let roundedValue = slider.value.rounded()
        // print("The rounded value is: \(roundedValue)")
        currentValue = Int(roundedValue)
        startNewRound()
        
        // customization for the slider
        
        //let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let  thumbImageNormalHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageNormal, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert() {
        
//        var diffrence = currentValue - targetValue
//       // var sliderDifference = targetValue - currentValue
//
//        if 0 > diffrence {
//            diffrence *= -1 //diffrence = diffrence * (-1)
//        }
        let diffrence = abs(targetValue - currentValue)
        var points = 100 - diffrence
        score += points
        
        let title: String
        if diffrence == 0{
            points += 100
            title = "Perfect!"
        }else if diffrence <= 1{
            points += 50
            title = "Nice Just 1 off"
        }else if diffrence < 5{
            title = "You almost had it "
        }else if diffrence < 10 {
            title = "pretty good"
        } else{
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)

        let action = UIAlertAction(title: "Close", style: .default, handler: {
            action in
            self.startNewRound()
        })

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
        
        //startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        //print("Value of the slider is : \(slider.value)")
        let roundedValue = slider.value.rounded()
        // print("The rounded value is: \(roundedValue)")
        currentValue = Int(roundedValue)
    }
    
    @IBAction func StartOver() {
        round = 0
        score = 0
        updateLabels()
        startNewRound()
    }
    
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
       
    }
    func updateLabels (){
        label.text = String(targetValue)
        tscore.text = String(score)
        NumberRound.text = String(round)
    }
    
   
}

