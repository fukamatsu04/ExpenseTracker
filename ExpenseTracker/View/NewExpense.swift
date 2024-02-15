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
                    .foregroundColor(.white)
                
                // MARK: Custom TextField
                // For Currency Symbol
                let symbol: Substring? = expenseViewModel.convertNumberToPrice(value: 0).prefix(2)
                if symbol != nil{
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
                                    Text(String(symbol!))
                                        .opacity(0.5)
                                        .offset(x: -25, y: 5)
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
                
                Label{
                    TextField("Remark", text: $expenseViewModel.remark)
                        .padding(.leading,10)
                } icon: {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                        .font(.title3)
                        .foregroundStyle(Color.gray)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 15)
                .background{
                    RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.white)
                }
                .padding(.top, 25)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.purple, .orange], startPoint: .topTrailing, endPoint: .bottomTrailing).ignoresSafeArea())
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
