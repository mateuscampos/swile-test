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
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.heading1,
                                                                 .foregroundColor: UIColor.headingText]
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.transactionsGroupedByMonth) { group in
                    Section {
                        ForEach(group.transactions) { transaction in
                            TransactionListRow(transaction: transaction)
                                .listRowSeparator(.hidden)
                                .onTapGesture {
                                    viewModel.selectedTransaction = transaction
                                    viewModel.showDetail = true
                                }
                        }
                        .listRowBackground(Color(.background))
                    } header: {
                        Text(group.monthName)
                            .font(Font(UIFont.defaultMedium))
                            .foregroundColor(Color(UIColor.sectionText))
                    }
                    .textCase(nil)
                }
            }
            .navigationTitle("Titres-resto")
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .background(Color(.background))
            .refreshable {
                viewModel.fetch()
            }
        }
        .alert(Text("Oups! Une erreur est survenue!"),
               isPresented: $viewModel.showErrorAlert, actions: {
            Button("Ok") {
                viewModel.alertHandler()
            }
        })
        .fullScreenCover(isPresented: $viewModel.showDetail, content: {
            if let transaction = viewModel.selectedTransaction {
                TransactionDetailView(transaction: transaction)
            }
        })
        .onAppear(perform: viewModel.fetch)
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionListViewModel.preview())
    }
}
