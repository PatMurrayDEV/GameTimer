//
//  TimerObject.swift
//  PictionaryTimer
//
//  Created by Patrick Murray on 5/12/2015.
//  Copyright © 2015 Patrick Murray. All rights reserved.
//

import UIKit

protocol Timer {
    func updateTimeDisplay(string: String)
    func timerStopped()
}


class TimerObject: NSObject {
    
    // MARK: Singleton
    static let sharedInstance = TimerObject()
    
    // MARK: Delegate Varibales
    var deviceDelegate: Timer?
    var externalDelegate: Timer?
    
    
    // MARK: Class Variables
    var startTime = NSTimeInterval()
    var endTime = NSTimeInterval()
    var timer = NSTimer()
    
    required override init() {
        super.init()
    }
    
    
    // MARK: - Actions
    internal func startTimer() {
        
        let aSelector : Selector = "updateScreen"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        endTime = startTime + 10.0;  // FIXME: Testing
        
    }

    
    // MARK: - Timer
    func updateScreen() {
        let time = updateTime()
        deviceDelegate?.updateTimeDisplay(time)
        externalDelegate?.updateTimeDisplay(time)
    }
    
    
    
    func updateTime() -> String {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        var elapsedTime: NSTimeInterval = endTime - currentTime
        
        if elapsedTime >= 0.0 {
            
            let minutes = UInt8(elapsedTime / 60.0)
            elapsedTime -= (NSTimeInterval(minutes) * 60)
            let seconds = UInt8(elapsedTime)
            elapsedTime -= NSTimeInterval(seconds)
            let fraction = UInt8(elapsedTime * 100)
            
            //add the leading zero for minutes, seconds and millseconds and store them as string constants
            let strMinutes = String(format: "%02d", minutes)
            let strSeconds = String(format: "%02d", seconds)
            let strFraction = String(format: "%02d", fraction)
            
            //concatenate minutes, seconds and milliseconds as assign it to the UILabel
            return "\(strMinutes):\(strSeconds):\(strFraction)"
            
        } else {
            timer.invalidate()
            deviceDelegate?.timerStopped()
            externalDelegate?.timerStopped()
            return "00:00:00"
        }
        
    }


}
