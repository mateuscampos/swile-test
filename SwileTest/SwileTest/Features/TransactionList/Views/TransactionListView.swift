//
//  TransactionListView.swift
//  SwileTest
//
//  Created by Mateus de Campos on 13/03/23.
//

import SwiftUI

struct TransactionListView: View {

    @ObservedObject var viewModel: TransactionListViewModel
    @State var selectedTransaction: Transaction
    @Namespace var animation
    @State var show = false
    

    public init(viewModel: TransactionListViewModel) {
        self.viewModel = viewModel
        self._selectedTransaction = State(initialValue: Transaction.preview())
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.heading1,
                                                                 .foregroundColor: UIColor.headingText]
    }

    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    ForEach(viewModel.transactionsGroupedByMonth) { group in
                        Section {
                            ForEach(group.transactions) { transaction in
                                TransactionListRow(transaction: transaction, animation: animation)
                                    .listRowSeparator(.hidden)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            selectedTransaction = transaction
                                            show.toggle()
                                        }
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
            .opacity(show ? 0 : 1)

            if show {
                TransactionDetailView(quickActions: [.changeAccount(selectedTransaction.smallIcon.category.imageName(),
                                                                    selectedTransaction.largeIcon.category.illustrationColor()),
                                                     .accountShare,
                                                     .like,
                                                     .speakWithUs],
                                      selectedTransaction: $selectedTransaction,
                                      show: $show,
                                      animation: animation)
            }
        }
        .alert(Text("Oups! Une erreur est survenue!"),
               isPresented: $viewModel.showErrorAlert, actions: {
            Button("Ok") {
                viewModel.alertHandler()
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
