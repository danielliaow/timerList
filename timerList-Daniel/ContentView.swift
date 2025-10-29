//
//  ContentView.swift
//  timerList-Daniel
//
//  Created by Daniel on 10/23/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = timerViewModel()
    
    var body: some View {
        VStack {
            TimelineView(.periodic(from: .now, by: 0.01)) { context in
                List {
                    ForEach(vm.timers) { timer in
                        HStack {
                            Text(timer.currentElapsed(now: context.date))
                                .foregroundColor(timer.start == nil ? .gray : .primary)
                        }
                        .onTapGesture {
                            vm.toggleUser(timer.id)
                        }
                        .onAppear {
                            vm.resumeIfNotUserPaused(timer.id)
                        }
                        .onDisappear {
                            vm.systemPause(timer.id)
                        }
                    }
                }
            }
        }
        .padding()
    }
}
