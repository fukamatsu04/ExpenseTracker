//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 18/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack{
                ExpenseCardView()
                SpendingCardView()
            }
        }
    }
    
    // MARK: Expense Gradient View
    @ViewBuilder
    func ExpenseCardView()->some View{
        //DEV MARK: MAYBE REMOVE GEOMETRYREADER
        GeometryReader{proxy in
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .fill(
                        LinearGradient(colors: [.purple, .orange], startPoint: .topTrailing, endPoint: .bottomTrailing)
                    )
            VStack{
                Text("Current Balance")
                Text("$320,30")
                    .padding([.top, .bottom], 5)
                    .font(.system(size: 50))
                Text("September 25")
                
                HStack{
                    Image(systemName: "arrow.down.left.circle.fill")
                    
                    VStack(spacing: 4){
                        Text("INCOME")
                        Text("250,00")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 23)
                    
                    Image(systemName: "arrow.down.left.circle.fill")
                    
                    VStack(spacing: 4){
                        Text("EXPENSE")
                        Text("250,00")
                    }.padding(.top, 23)
                }
                .padding(.horizontal)
                .padding(.trailing)
                
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func SpendingCardView()-> some View{
        
        VStack{
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
            Text("oi")
        }
        .frame(maxWidth: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}
