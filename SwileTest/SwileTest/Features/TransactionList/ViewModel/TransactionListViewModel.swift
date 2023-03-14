//
//  TransactionListViewModel.swift
//  SwileTest
//
//  Created by Mateus de Campos on 10/03/23.
//

import Foundation

class TransactionListViewModel: ObservableObject {

    @Published var transactions: [Transaction] = []
    
    func fetch() {
        let transactionListService = Service<TransactionListResponseModel>(url: Endpoint.transactionList.url(),
                                                                           method: .get) { result in
            switch result {
            case .success(let responseModel):
                print("Transactions: \(responseModel.transactions)")
                self.transactions = responseModel.transactions
            case .failure(let error):
                print("Error fetching transactions: \(error.localizedDescription)")
            }
        }
        transactionListService.start()
    }
}

extension TransactionListViewModel {
    static func preview() -> TransactionListViewModel {
        return TransactionListViewModel()
    }
}
