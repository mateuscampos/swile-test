//
//  TransactionListViewModel.swift
//  SwileTest
//
//  Created by guru on 10/03/23.
//

import Foundation

class TransactionListViewModel {
    
    func fetch() {
        let transactionListService = Service<TransactionListResponseModel>(url: Endpoint.transactionList.url(),
                                                                           method: .get) { result in
            switch result {
            case .success(let responseModel):
                print("Transactions: \(responseModel.transactions)")
            case .failure(let error):
                print("Error fetching transactions: \(error.localizedDescription)")
            }
        }
        transactionListService.start()
    }
}
