//
//  CoordinatorView.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//
import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .episodeList)
                .navigationDestination(for: AppScreens.self) { page in
                    coordinator.build(page: page)
                }
        }
        .tint(.secondary)
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
