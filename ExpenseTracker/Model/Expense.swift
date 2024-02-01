//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Reimi Nagao on 01/02/24.
//

import Foundation
import SwiftUI

// MARK: Expense Model And Sample Data
struct Expense: Identifiable,Hashable{
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: Color
}

enum ExpenseType: String{
    case income = "Income"
    case expense = "expense"
    case all = "ALL"
}

var sample_expense: [Expense] = [
    Expense(remark: "Mouse", amount: 99, date: Date(timeIntervalSince1970: 1), type: .expense, color: .red),
    Expense(remark: "Key Board", amount: 76, date: Date(timeIntervalSince1970: 1), type: .expense, color: .green),
    Expense(remark: "Webcam", amount: 22, date: Date(timeIntervalSince1970: 1), type: .expense, color: .yellow),
    Expense(remark: "PC", amount: 320, date: Date(timeIntervalSince1970: 111111111), type: .expense, color: .blue),
    Expense(remark: "Mouse", amount: 99, date: Date(timeIntervalSince1970: 1), type: .expense, color: .pink),
    //Expense(remark: "Mouse", amount: 99, date: Date(timeIntervalSince1970: 1), type: .expense, color: .green),
    //Expense(remark: "Mouse", amount: 99, date: Date(timeIntervalSince1970: 1), type: .expense, color: .gray),
]
