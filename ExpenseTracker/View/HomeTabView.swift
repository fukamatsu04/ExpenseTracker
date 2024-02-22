//
//  HomeTabView.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 22/02/24.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        
        VStack {
            TabView {
                Home()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                CategoryView()
                    .tabItem {
                        Image(systemName: "square.grid.3x3.topright.filled")
                        Text("Category")
                    }
                AddExpense()
                    .tabItem {
                        Image(systemName: "plus.app")
                        Text("Add expenses")
                    }
                ChartView()
                    .tabItem {
                        Image(systemName: "chart.pie")
                        Text("Chart")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Person")
                    }
            }
        }
        .tint(.purple)
    }
}

#Preview {
    HomeTabView()
}
