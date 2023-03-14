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
                    ImageView(imageName: "icon_sushi", url: transaction.largeIcon?.url)
                        .frame(width: transaction.largeIconSize, height: transaction.largeIconSize)
                }
                .frame(width: 56, height: 56)
                .cornerRadius(26)
                .overlay(
                    RoundedRectangle(cornerRadius: 26)
                        .stroke(Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.06)),
                                lineWidth: 1)
                )
                
                    
                ImageView(imageName: "", url: transaction.smallIcon?.url)
                    .background(Color(.white))
                    .frame(width: 16, height: 16)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 1)),
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
