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
    
    
}

