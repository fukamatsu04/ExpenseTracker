//
//  HomeTabView.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 22/02/24.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
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
                Spacer()
                    .tabItem {
                        EmptyView()
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
            .tint(.purple)
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 24))
            }
            .frame(width: 50, height: 50)
            .background(.purple)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 10)))
        }
    }
}

#Preview {
    HomeTabView()
}
