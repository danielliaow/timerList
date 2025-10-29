//
//  timerViewModel.swift
//  timerList-Daniel
//
//  Created by Daniel on 10/23/25.
//

import Foundation

@MainActor
class timerViewModel: ObservableObject {
    @Published var timers: [timerModel] = []
    
    init() {
        add50Timers()
    }
    
    func toggleUser(_ id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        timers[index].toggleUser()
    }
    
    func systemPause(_ id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        if timers[index].userPaused == false {
            timers[index].pause()
        }
    }
    
    func resumeIfNotUserPaused(_ id: UUID) {
        guard let index = timers.firstIndex(where: { $0.id == id }) else { return }
        if timers[index].userPaused == false {
            timers[index].resume()
        }
    }
    
    func add50Timers() {
        for _ in 0..<50 {
            timers.append(timerModel())
        }
    }
    
}
