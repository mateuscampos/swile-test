//
//  TransactionListRow.swift
//  SwileTest
//
//  Created by Mateus de Campos on 13/03/23.
//

import SwiftUI

struct TransactionListRow: View {

    var transaction: Transaction

    init(transaction: Transaction) {
        self.transaction = transaction
    }

    var body: some View {
        HStack {
            ZStack {
                VStack {
                    ImageView(imageName: transaction.largeIcon.category.imageName(),
                              url: transaction.largeIcon.url)
                    .frame(width: transaction.largeIconSize, height: transaction.largeIconSize)
                }
                .frame(width: 56, height: 56)
                .background(Color(transaction.largeIcon.category.illustrationColor()))
                .cornerRadius(26)
                .overlay(
                    RoundedRectangle(cornerRadius: 26)
                        .stroke(Color(.borderGray),
                                lineWidth: 1)
                )
                VStack {
                    ImageView(imageName: transaction.smallIcon.category.imageName(),
                              url: transaction.smallIcon.url)
                    .frame(width: 12, height: 12)
                }
                .frame(width: 16, height: 16)
                .background(Color(.background))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.borderWhite),
                                lineWidth: 3)
                )
                .offset(x: 21, y: 21)
            }
            .padding(.trailing, Spacing.medium)
            VStack(alignment: .leading, spacing: Spacing.extraSmall) {
                HStack {
                    Text(transaction.name)
                    Spacer()
                    Text(transaction.amountWithCurrency)
                }
                Text(transaction.description)
            }
        }
    }
}

struct ImageView: View {

    var url: URL?
    var imageName: String

    init(imageName: String, url: URL?) {
        self.imageName = imageName
        self.url = url
    }

    var body: some View {
        if let url = self.url {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct TransactionListRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListRow(transaction: Transaction.preview())
    }
}
