//
//  TransactionListRow.swift
//  SwileTest
//
//  Created by Mateus de Campos on 13/03/23.
//

import SwiftUI

struct TransactionListRow: View {

    var transaction: Transaction
    var animation: Namespace.ID

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
                        .inset(by: 1)
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
            .matchedGeometryEffect(id: transaction.id, in: animation)
            .padding(.trailing, Spacing.medium)
            VStack(alignment: .leading, spacing: Spacing.extraSmall) {
                HStack {
                    Text(transaction.name)
                        .font(Font(UIFont.largeMedium))
                        .foregroundColor(Color(UIColor.titleText))
                    Spacer()
                    if transaction.isPositive {
                        Text(transaction.amountWithCurrency)
                            .font(Font(UIFont.largeMedium))
                            .foregroundColor(Color(.highlightText))
                            .padding(.horizontal, Spacing.small)
                            .padding(.vertical, Spacing.extraSmall)
                            .background(Color(.highlightBackground))
                            .cornerRadius(9)
                    } else {
                        Text(transaction.amountWithCurrency)
                            .font(Font(UIFont.largeMedium))
                            .foregroundColor(Color(UIColor.titleText))
                    }
                }
                Text(transaction.description)
                    .font(Font(UIFont.smallDefault))
                    .foregroundColor(Color(UIColor.subtitleText))
            }
        }
    }
}

struct TransactionListRow_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        TransactionListRow(transaction: Transaction.preview(), animation: namespace)
    }
}
