//
//  ViewController.swift
//  PictionaryTimer
//
//  Created by Patrick Murray on 5/12/2015.
//  Copyright © 2015 Patrick Murray. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Timer, ScoreManagerDelegate {
    
    // MARK: - Variables
    // MARK: iPhone Display
    @IBOutlet var displayTimeLabel: UILabel!
    @IBOutlet weak var startButton: RoundedButton!
    
    // MARK: Team A
    @IBOutlet weak var teamANameLabel: UILabel!
    @IBOutlet weak var teamAScoreLabel: UILabel!
    @IBOutlet weak var teamAStepper: UIStepper!
    
    // MARK: Team B
    @IBOutlet weak var teamBNameLabel: UILabel!
    @IBOutlet weak var teamBScoreLabel: UILabel!
    @IBOutlet weak var teamBStepper: UIStepper!
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayTimeLabel.font = UIFont.monospacedDigitSystemFontOfSize(70, weight: UIFontWeightRegular)
        
        TimerObject.sharedInstance.deviceDelegate = self
        ScoreManager.sharedInstance.deviceDelegate = self
        
        teamANameLabel.text = ScoreManager.sharedInstance.teamA.teamName
        teamBNameLabel.text = ScoreManager.sharedInstance.teamB.teamName
        
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
    
    // MARK: - Teams
    // MARK: Scores
    @IBAction func teamAStepperValueChanged(sender: UIStepper) {
        ScoreManager.sharedInstance.setScore(ScoreManager.sharedInstance.teamA, score: Int(sender.value))
    }
    
    @IBAction func teamBStepperValueChanged(sender: UIStepper) {
        ScoreManager.sharedInstance.setScore(ScoreManager.sharedInstance.teamB, score: Int(sender.value))
    }
    
    // MARK: Delegate
    func updateScores(teamAScore: Int, teamBScore: Int) {
        teamAScoreLabel.text = "\(teamAScore)"
        teamBScoreLabel.text = "\(teamBScore)"
        teamANameLabel.text = ScoreManager.sharedInstance.teamA.teamName
        teamBNameLabel.text = ScoreManager.sharedInstance.teamB.teamName
    }
    
    
}

