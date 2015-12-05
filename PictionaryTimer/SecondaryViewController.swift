//
//  SecondaryViewController.swift
//  PictionaryTimer
//
//  Created by Patrick Murray on 5/12/2015.
//  Copyright © 2015 Patrick Murray. All rights reserved.
//

import UIKit

class SecondaryViewController: UIViewController, Timer {
    
    // MARK: iPhone Display
    @IBOutlet var displayTimeLabel: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayTimeLabel.font = UIFont.monospacedDigitSystemFontOfSize(180, weight: UIFontWeightRegular)
        
        TimerObject.sharedInstance.externalDelegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Timer
    func updateTimeDisplay(string: String) {
        displayTimeLabel.text = string;
    }
    
    func timerStopped() {
        displayTimeLabel.text = "01:00:00"
    }

}
