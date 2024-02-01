//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 29/01/24.
//

import SwiftUI

class ExpenseViewModel: ObservableObject{
    
    //MARK: Properties
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var currentMonthAndYear: Date = Date()
    
    init(){
        //MARK: Fetching Current Month Starting Date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: Date())
        
        startDate = calendar.date(from: components)!
        currentMonthAndYear = calendar.date(from: components)!
        
    }
    
    //MARK: Formatting Current Month And Year data to a string
    func currentMonthAndYearString()->String{
        return currentMonthAndYear.formatted(date: .abbreviated, time: .omitted)
    }
    
    @Published var expenses: [Expense] = sample_expense
    
    func convertExpensesToCurrency(expenses: [Expense], type: ExpenseType = .all)->String{
        var value: Double = 0
        value = expenses.reduce(0, { partialResult, expense in return partialResult + (type == .all ? (expense.type == .income ? expense.amount : -expense.amount) : (expense.type == type ? expense.amount : 0))
        })
        
        return convertNumberToPrice(value: value)
    }
    
    //MARK: Converting Number To Price
    func convertNumberToPrice(value: Double)-> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: .init(value: value)) ?? "$0.00"
    }
    
}

