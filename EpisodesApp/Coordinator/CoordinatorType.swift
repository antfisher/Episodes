//
//  CoordinatorType.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import Foundation

protocol CoordinatorType: AnyObject {
    
    func push(page: AppScreens)
    func pop()
    func popToRoot()
}
