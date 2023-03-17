//
//  TransactionListViewModel.swift
//  SwileTest
//
//  Created by Mateus de Campos on 10/03/23.
//

import Foundation

class TransactionListViewModel: ObservableObject {

    @Published var transactionsGroupedByMonth: [TransactionMonthGroup] = []
    @Published var showErrorAlert: Bool = false
    @Published var showDetail: Bool = false
    var selectedTransaction: Transaction?

    func fetch() {
        let transactionListService = Service<TransactionListResponseModel>(url: Endpoint.transactionList.url(),
                                                                           method: .get) { result in
            switch result {
            case .success(let responseModel):
                self.transactionsGroupedByMonth = self.groupByMonth(responseModel.transactions)
            case .failure(_):
                self.showErrorAlert = true
            }
        }
        transactionListService.start()
    }

    func groupByMonth(_ transactions: [Transaction]) -> [TransactionMonthGroup] {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        dateFormatter.locale = Locale(identifier: "fr_FR")

        let groupedTransactions = Dictionary(grouping: transactions) { transaction -> DateComponents in
            let date = transaction.date.fromServerToDate
            return calendar.dateComponents([.year, .month], from: date)
        }

        let sortedGroups = groupedTransactions.sorted { (group1, group2) -> Bool in
            guard let year1 = group1.key.year,
                    let year2 = group2.key.year,
                    let month1 = group1.key.month,
                    let month2 = group2.key.month else {
                return false
            }

            if year1 > year2 {
                return true
            } else if year1 < year2 {
                return false
            } else {
                return month1 > month2
            }
        }

        let transactionsByMonth = sortedGroups.compactMap { (dateComponents, transactions) -> TransactionMonthGroup? in
            guard let date = calendar.date(from: dateComponents) else {
                return nil
            }
            let monthName = dateFormatter.string(from: date)
            let sortedTransactions = transactions.sorted { $0.date.fromServerToDate > $1.date.fromServerToDate }
            return TransactionMonthGroup(monthName: monthName.capitalized, transactions: sortedTransactions)
        }

        return transactionsByMonth
    }

    func alertHandler() {
        self.showErrorAlert = false
    }

    func isSelectedTransactionTheCurrentTransaction(_ currentTransaction: Transaction) -> Bool {
        guard let selected = self.selectedTransaction else {
            return false
        }
        return selected.id == currentTransaction.id
    }
}

extension TransactionListViewModel {
    static func preview() -> TransactionListViewModel {
        return TransactionListViewModel()
    }
}
