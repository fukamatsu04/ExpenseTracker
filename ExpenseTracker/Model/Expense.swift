//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 01/02/24.
//

import Foundation

// MARK: Expense Model And Sample Data
struct Expense: Identifiable,Hashable{
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String{
    case income = "Income"
    case expense = "expense"
}

var sample_expense: [Expense] = [
    Expense(remark: "Mouse", amount: 99, date: Date(timeIntervalSince1970: 111111111), type: .expense, color: "Green"),
    Expense(remark: "Mouse", amount: 99, date: Date(timeIntervalSince1970: 111111111), type: .expense, color: "Green"),
    Expense(remark: "Mouse", amount: 99, date: Date(timeIntervalSince1970: 111111111), type: .expense, color: "Green"),
    Expense(remark: "Mouse", amount: 99, date: Date(timeIntervalSince1970: 111111111), type: .expense, color: "Green"),
]
