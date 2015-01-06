//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Ashiv Shah on 31/12/14.
//  Copyright (c) 2014 Preksha Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        let alert = UIAlertController( title : "Hello World" ,
            message : message,
            preferredStyle : .Alert)
        let action = UIAlertAction(title : "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion:nil)
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(slider : UISlider) {
        currentValue = lroundf(slider.value)
    }
    
}

