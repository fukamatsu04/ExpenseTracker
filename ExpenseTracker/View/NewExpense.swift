//
//  NewExpense.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 12/02/24.
//

import SwiftUI

struct NewExpense: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    //MARK: Environment Values
    @Environment(\.self) var env
    var body: some View {
        VStack{
            VStack(spacing: 15){
                Text("Add Expenses")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .opacity(0.5)
                
                // MARK: Custom TextField
                // For Currency Symbol
                if let symbol = expenseViewModel.convertNumberToPrice(value: 0).first{
                    TextField("0", text: $expenseViewModel.amount)
                        .font(.system(size: 35))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background{
                            Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
                                .font(.system(size: 35))
                                .opacity(0)
                                .overlay(alignment: .leading){
                                    Text(String(symbol))
                                        .opacity(0.5)
                                        .offset(x: -15, y: 5)
                                }
                        }
                        .padding(.vertical,10)
                        .frame(maxWidth: .infinity)
                        .background{
                            Capsule().fill(.white)
                        }
                        .padding(.horizontal,20)
                        .padding(.top)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{Color.theme.background.ignoresSafeArea()}
        .overlay(alignment: .topTrailing){
            
            //MARK: Close Button
            Button{
                env.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .opacity(0.7)
            }
        }
    }
}

#Preview {
    NewExpense().environmentObject(ExpenseViewModel())
}
