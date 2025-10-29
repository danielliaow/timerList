//
//  timerModel.swift
//  timerList-Daniel
//
//  Created by Daniel on 10/23/25.
//

import Foundation

struct timerModel: Identifiable {
    let id: UUID = UUID()
    var start: Date?
    var elapsed: TimeInterval = 0
    var userPaused: Bool = false
    

    
    mutating func pause() {
        if let start = start {
            elapsed += Date().timeIntervalSince(start)
            self.start = nil
        }
    }
    
    mutating func resume() {
        if start == nil {
            self.start = Date()
        }
    }
    
    mutating func toggleUser() {
        if start == nil {
            userPaused = false
            start = Date()
        } else {
            pause()
            userPaused = true
        }
    }
    
    
    func currentElapsed(now: Date) -> String {
        let total = elapsed + (start.map({ now.timeIntervalSince($0) }) ?? 0)
        let seconds = Int(total) % 60
        let milliseconds = Int((total - Double(Int(total))) * 100)
        return String(format: "%02d.%02d", seconds, milliseconds)
    }
}

