//
//  ViewController.swift
//  PictionaryTimer
//
//  Created by Patrick Murray on 5/12/2015.
//  Copyright © 2015 Patrick Murray. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Timer {
    
    // MARK: - Variables
    // MARK: External Display
    var externalWindow: UIWindow!
    var externalDisplayTimeLabel: UILabel!
    
    // MARK: iPhone Display
    @IBOutlet var displayTimeLabel: UILabel!
    @IBOutlet weak var startButton: RoundedButton!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayTimeLabel.font = UIFont.monospacedDigitSystemFontOfSize(70, weight: UIFontWeightRegular)
        
        
        
        TimerObject.sharedInstance.deviceDelegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    // MARK: - Actions
    @IBAction func startButtonTapped(sender: AnyObject) {
        TimerObject.sharedInstance.startTimer()
    }
    
    
    
    // MARK: - Timer
    func updateTimeDisplay(string: String) {
        displayTimeLabel.text = string;
    }
    
    func timerStopped() {
        displayTimeLabel.text = "01:00:00"
    }
}

