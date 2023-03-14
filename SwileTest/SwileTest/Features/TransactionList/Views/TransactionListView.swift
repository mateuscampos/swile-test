//
//  TransactionListView.swift
//  SwileTest
//
//  Created by Mateus de Campos on 13/03/23.
//

import SwiftUI

struct TransactionListView: View {

    @ObservedObject var viewModel: TransactionListViewModel

    public init(viewModel: TransactionListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.transactions) { transaction in
                    TransactionListRow(transaction: transaction)
                        .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("Titres-resto")
            .listStyle(.grouped)
        }
        .onAppear(perform: viewModel.fetch)
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionListViewModel.preview())
    }
}
