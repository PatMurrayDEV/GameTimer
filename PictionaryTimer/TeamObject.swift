//
//  TeamObject.swift
//  PictionaryTimer
//
//  Created by Patrick Murray on 5/12/2015.
//  Copyright © 2015 Patrick Murray. All rights reserved.
//

import UIKit

class TeamObject: NSObject {
    
    var teamName: String!
    var score = 0
    
    required init(name: String) {
        super.init()
        teamName = name
    }
    
    internal func setTeamScore(amount: Int) {
        score = amount
    }
    
    
}
