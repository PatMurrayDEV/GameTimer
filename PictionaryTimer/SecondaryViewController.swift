//
//  SecondaryViewController.swift
//  PictionaryTimer
//
//  Created by Patrick Murray on 5/12/2015.
//  Copyright © 2015 Patrick Murray. All rights reserved.
//

import UIKit

class SecondaryViewController: UIViewController, Timer, ScoreManagerDelegate {
    
    // MARK: IBOutlets
    @IBOutlet var displayTimeLabel: UILabel!
    @IBOutlet weak var teamANameLabel: UILabel!
    @IBOutlet weak var teamAScoreLabel: UILabel!
    @IBOutlet weak var teamBNameLabel: UILabel!
    @IBOutlet weak var teamBScoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayTimeLabel.font = UIFont.monospacedDigitSystemFontOfSize(190, weight: UIFontWeightRegular)
        
        TimerObject.sharedInstance.externalDelegate = self
        ScoreManager.sharedInstance.externalDelegate = self
        
        teamANameLabel.text = ScoreManager.sharedInstance.teamA.teamName
        teamBNameLabel.text = ScoreManager.sharedInstance.teamB.teamName
        
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
    
    // MARK: - Scores
    func updateScores(teamAScore: Int, teamBScore: Int) {
        teamAScoreLabel.text = "\(teamAScore)"
        teamBScoreLabel.text = "\(teamBScore)"
        teamANameLabel.text = ScoreManager.sharedInstance.teamA.teamName
        teamBNameLabel.text = ScoreManager.sharedInstance.teamB.teamName
    }

}
