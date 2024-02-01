//
//  TransactionCardView.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 30/01/24.
//

import SwiftUI

struct TransactionCardView: View {
    
    var expense: Expense
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var body: some View {
        
        HStack(spacing: 12){
            //MARK: First Letter Avatar
            if let  first = expense.remark.first{
                Text(String(first))
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background{
                        Circle()
                            .fill(Color(expense.color))
                    }
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 5, y: 5)
            }
                
            Text(expense.remark)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.padding(.horizontal)
    }
}
