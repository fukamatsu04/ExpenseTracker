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
        NavigationView{
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
                    
                    //MARK: Custom Label "Remark"
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
                    
                    //MARK: Custom label "Checkbox"
                    Label{
                        
                        CustomCheckboxes()
                        
                    } icon: {
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.title3)
                            .foregroundStyle(Color.gray)
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 15)
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.white)
                    }
                    .padding(.top, 10)
                    
                    //MARK: Custom Label "Dateset"
                    Label{
                        DatePicker.init("", selection: $expenseViewModel.date, in:Date.distantPast...Date(), displayedComponents: [.date])
                            .datePickerStyle(.compact)
                            .labelsHidden()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } icon: {
                        Image(systemName: "calendar")
                            .font(.title3)
                            .foregroundStyle(Color.gray)
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 15)
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.white)
                    }
                    .padding(.top, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // MARK: Save Button
                Button {
                    
                } label: {
                    Text("Save")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .opacity(0.7)
                        .background{
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(.white)
                        }
                        .foregroundStyle(.black)
                }
                .disabled(expenseViewModel.remark == ""
                          || expenseViewModel.type == .all
                          || expenseViewModel.amount == "")
                .opacity(expenseViewModel.remark == ""
                         || expenseViewModel.type == .all
                         || expenseViewModel.amount == "" ? 0.6 : 1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
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
    
    //MARK: Custom Checkbox
    @ViewBuilder
    func CustomCheckboxes()-> some View{
        HStack(spacing: 10){
            ForEach([ExpenseType.income, ExpenseType.expense], id: \.self){type in
                ZStack{
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.black,lineWidth: 2)
                        .opacity(0.5)
                        .frame(width: 20, height: 20)
                    
                    if expenseViewModel.type == type{
                        Image(systemName: "checkmark")
                            .font(.caption.bold())
                            .foregroundStyle(.green)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    expenseViewModel.type = type
                }
                
                Text(type.rawValue.capitalized)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .opacity(0.7)
                    .padding(.trailing, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 10)
    }
}

#Preview {
    NewExpense().environmentObject(ExpenseViewModel())
}
