//
//  RoundedButton.swift
//  PictionaryTimer
//
//  Created by Patrick Murray on 5/12/2015.
//  Copyright © 2015 Patrick Murray. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.clearColor()
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.whiteColor().CGColor

        
    }
    

    
}