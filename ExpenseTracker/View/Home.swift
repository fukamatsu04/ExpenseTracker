//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 18/01/24.
//

import SwiftUI

struct Home: View {

    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        VStack{
            ExpenseCardView()
            SpendingCardView()
        }
        .ignoresSafeArea()
        .background(Color.theme.background)
    }
    
    
    // MARK: Expense Gradient View
    @ViewBuilder
    func ExpenseCardView()->some View{
    
        VStack{
            Text("Current Balance")
            Text("$320,30")
                .padding([.top, .bottom], 5)
                .font(.system(size: 50))
            //MARK: Currently Going Month and Date String
            Text(expenseViewModel.currentMonthAndYearString())
            
            HStack{
                Image(systemName: "arrow.down.left.circle.fill")
                
                VStack(spacing: 4){
                    Text("INCOME")
                    Text("250,00")
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 23)
                
                Image(systemName: "arrow.up.forward.circle.fill")
                
                VStack(spacing: 4){
                    Text("EXPENSE")
                    Text("250,00")
                }.padding(.top, 23)
            }
            .padding(.horizontal)
            .padding(.trailing)
            
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(LinearGradient(colors: [.purple, .orange], startPoint: .topTrailing, endPoint: .bottomTrailing))
            .foregroundStyle(.white)
            .cornerRadius(25)
            .padding(.bottom, 60)
    }
    
    @ViewBuilder
    func SpendingCardView()-> some View{
        
        ScrollView(.vertical){
            
            VStack{
                ForEach(expenseViewModel.expenses){
                    expense in TransactionCardView(expense: expense).environmentObject(expenseViewModel)
                }
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(.horizontal)
        }.offset(y: -110)
            .padding(.bottom, -20)
    }
}

#Preview {
    NavigationView{
        Home()
    }
}

