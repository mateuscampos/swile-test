//
//  TransactionDetailView.swift
//  SwileTest
//
//  Created by Mateus de Campos on 16/03/23.
//

import SwiftUI

struct TransactionDetailView: View {

    @State private var isAnimating = false

    @Environment(\.dismiss) var dismiss
    let screenWidth = UIScreen.main.bounds.width
    let headerAspectRatio: CGFloat = 375 / 224
    let quickActions: [TransactionQuickActions]

    var transaction: Transaction

    init(transaction: Transaction) {
        self.transaction = transaction
        self.quickActions = [
            .changeAccount(transaction.smallIcon.category.imageName(),
                           transaction.largeIcon.category.illustrationColor()),
            .accountShare,
            .like,
            .speakWithUs
        ]
    }

    var body: some View {
        VStack(spacing: Spacing.extraLarge) {
            if isAnimating {
                header()
                    .transition(.scale)
                infoSection()
                    .transition(.move(edge: .bottom))
                actionsSection()
                    .transition(.move(edge: .bottom))
            }
            Spacer()
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                isAnimating = true
            }
        }
    }

    @ViewBuilder
    func header() -> some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    ImageView(imageName: transaction.largeIcon.category.imageName(),
                              url: transaction.largeIcon.url)
                    .frame(width: transaction.headerIconSize, height: transaction.headerIconSize)
                }
                VStack {
                    ImageView(imageName: transaction.smallIcon.category.imageName(),
                              url: transaction.smallIcon.url)
                    .frame(width: 18, height: 18)
                }
                .frame(width: 24, height: 24)
                .background(Color(.background))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.borderWhite),
                                lineWidth: 3)
                )
                .offset(x: screenWidth/2 - 32,
                        y: (geometry.size.height/2))
                ImageView(imageName: "chevron", url: nil)
                    .frame(width: 24, height: 24)
                    .position(x: 24, y: 24)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isAnimating = false
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            dismiss()
                        }
                    }
            }
        }
        .frame(width: screenWidth, height: screenWidth/headerAspectRatio)
        .background(Color(transaction.largeIcon.category.illustrationColor()))
    }

    @ViewBuilder
    func infoSection() -> some View {
        VStack(spacing: Spacing.medium) {
            VStack(spacing: Spacing.small) {
                Text(transaction.amountWithCurrency)
                    .font(Font(UIFont.heading1))
                    .foregroundColor(Color(.titleText))
                Text(transaction.name)
                    .font(Font(UIFont.defaultStrong))
                    .foregroundColor(Color(.titleText))
            }
            Text(transaction.formattedDate.capitalizedSentence)
                .font(Font(UIFont.defaultMedium))
                .foregroundColor(Color(.subtitleText))
        }
    }

    @ViewBuilder
    func actionsSection() -> some View {
        VStack {
            List {
                Section {
                    ForEach(quickActions) { action in
                        HStack {
                            VStack {
                                ImageView(imageName: action.imageName(),
                                          url: action == .changeAccount("", .clear) ? transaction.smallIcon.url : nil)
                                .frame(width: 16, height: 16)
                            }
                            .frame(width: 32, height: 32)
                            .background(Color(action.iconBackgroundColor()))
                            .cornerRadius(14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .inset(by: 1)
                                    .stroke(Color(.borderGray),
                                            lineWidth: 1)
                            )
                            Text(action.title())
                                .font(Font(UIFont.largeMedium))
                                .foregroundColor(Color(.titleText))
                                .padding(.leading, Spacing.largerMedium)
                            Spacer()
                            if action.hasAction() {
                                Text(action.action())
                                    .font(Font(UIFont.smallStrong))
                                    .foregroundColor(Color(.actionHighlightText))
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                        .padding(.vertical, Spacing.small)
                        .alignmentGuide(.listRowSeparatorTrailing) { d in
                            d[.trailing]
                        }
                    }
                    .listRowBackground(Color(.background))
                }
                .listSectionSeparator(.hidden)
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .background(Color(.background))
            .padding(.top, -Spacing.extraLarge)
        }
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(transaction: Transaction.preview())
    }
}
