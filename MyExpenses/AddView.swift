//
//  AddView.swift
//  MyExpenses
//
//  Created by Denis Volkov on 12.01.2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    static let types = ["Bussines", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Название", text: $name)
                Picker("Тип", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
            }
            TextField("Стоимость", text: $amount)
                .keyboardType(.numberPad)
        }
        .navigationBarTitle("Добавить")
        .navigationBarItems(trailing: Button("Сохранить") {
            if let actualAmount = Int(self.amount) {
                let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                self.expenses.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
