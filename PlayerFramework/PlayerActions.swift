//
//  PlayerActions.swift
//  PlayerApp
//
//  Created by Aina Cuxart on 14/5/17.
//  Copyright © 2017 Aina Cuxart. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

public class PlayerActions: AVPlayer {
    
    var timesPaused: Int = 0
    var timesResumed: Int = 0
    
    var timeEllapsed = Array<Any>()
    var datePaused = Date()
    
    
    override public func pause() {
        super.pause()
        
        timesPaused += 1
        datePaused = Date()
        
    }
    
    public func resume() {
        super.play()
        
        timesResumed += 1
        
        let interval = Date().timeIntervalSince(datePaused)
        
        timeEllapsed.append(interval)
        
    }
    
    public func stop() {
        
        // Print values
        print("Times Video Paused: \(timesPaused)")
        print("Times Video Resumed: \(timesResumed)")
        print("Time ellapsed between pause and resume: \(timeEllapsed)")
        
        // Go to beginning
        let newTime = CMTimeMakeWithSeconds(0.0, 1)
        self.seek(to: newTime, toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero)
        self.pause()
        
        
        // Restart values
        timesPaused = 0
        timesResumed = 0
        timeEllapsed = Array()
        
    }
    
    
    func timesPausePressed() -> Int {
        return timesPaused
    }
    
    func timesResumePressed() -> Int {
        return timesResumed
    }
    
}
