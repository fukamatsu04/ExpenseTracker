//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 18/01/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeTabView()
            }
        }
    }
}
