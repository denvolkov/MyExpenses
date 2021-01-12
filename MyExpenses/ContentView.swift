//
//  ContentView.swift
//  MyExpenses
//
//  Created by Denis Volkov on 12.01.2021.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}


struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Мои расходы")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        let expense = ExpenseItem(name: "Test", type: "", amount: 50)
                                        self.expenses.items.append(expense)
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
        }
        
        }
    
    func removeItems(as offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
