//
//  ScoreManager.swift
//  PictionaryTimer
//
//  Created by Patrick Murray on 5/12/2015.
//  Copyright © 2015 Patrick Murray. All rights reserved.
//

import UIKit

protocol ScoreManagerDelegate {
    func updateScores(teamAScore: Int, teamBScore: Int)
}

class ScoreManager: NSObject {
    
    // MARK: Singleton
    static let sharedInstance = ScoreManager()
    
    // MARK: Delegate Variables
    var deviceDelegate: ScoreManagerDelegate?
    var externalDelegate: ScoreManagerDelegate?
    
    // MARK: Team Variables
    var teamA = TeamObject(name: "Team A")
    var teamB = TeamObject(name: "Team B")
    
    required override init() {
        super.init()
    }
    
    // MARK: - Public Functions
    internal func setScore(team: TeamObject, score: Int) {
        team.setTeamScore(score)
        updateDelegates()
    }

    internal func resestScores() {
        teamA.score = 0
        teamB.score = 0
        updateDelegates()
    }
    
    // MARK: - Private Functions
    func updateDelegates() {
        deviceDelegate?.updateScores(teamA.score, teamBScore: teamB.score)
        externalDelegate?.updateScores(teamA.score, teamBScore: teamB.score)
    }
}
