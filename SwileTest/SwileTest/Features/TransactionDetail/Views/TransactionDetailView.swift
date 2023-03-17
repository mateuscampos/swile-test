//
//  TransactionDetailView.swift
//  SwileTest
//
//  Created by Mateus de Campos on 16/03/23.
//

import SwiftUI

struct TransactionDetailView: View {

    @State private var isAnimatingInfo = false
    @State private var isAnimatingAction = false

    @Environment(\.dismiss) var dismiss
    var screenWidth = UIScreen.main.bounds.width
    var headerAspectRatio: CGFloat = 375 / 224
    let quickActions: [TransactionQuickActions]

    @Binding var selectedTransaction: Transaction
    @Binding var show: Bool
    var animation: Namespace.ID

    init(isAnimatingInfo: Bool = false,
         isAnimatingAction: Bool = false,
         screenWidth: CGFloat = UIScreen.main.bounds.width,
         headerAspectRatio: CGFloat = 375 / 224,
         quickActions: [TransactionQuickActions],
         selectedTransaction: Binding<Transaction>,
         show: Binding<Bool>,
         animation: Namespace.ID) {
        self._isAnimatingInfo = State(initialValue: isAnimatingInfo)
        self._isAnimatingAction = State(initialValue: isAnimatingAction)
        self.screenWidth = screenWidth
        self.headerAspectRatio = headerAspectRatio
        self.quickActions = quickActions
        self._selectedTransaction = selectedTransaction
        self._show = show
        self.animation = animation
    }

    var body: some View {
        VStack(spacing: Spacing.extraLarge) {
            header()
            if isAnimatingInfo {
                infoSection()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: AnyTransition.opacity))
            }
            if isAnimatingAction {
                actionsSection()
                    .transition(AnyTransition.move(edge: .bottom).combined(with: AnyTransition.opacity))
            }
            Spacer()
        }
        .onAppear(perform: startAnimations)
    }

    func startAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 0.4)) {
                isAnimatingInfo.toggle()
            }
        }
        withAnimation(.easeInOut(duration: 0.4).delay(1)) {
            isAnimatingAction.toggle()
        }
    }

    @ViewBuilder
    func header() -> some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    ImageView(imageName: selectedTransaction.largeIcon.category.imageName(),
                              url: selectedTransaction.largeIcon.url)
                    .frame(width: selectedTransaction.headerIconSize, height: selectedTransaction.headerIconSize)
                }
                VStack {
                    ImageView(imageName: selectedTransaction.smallIcon.category.imageName(),
                              url: selectedTransaction.smallIcon.url)
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
                            isAnimatingAction.toggle()
                            isAnimatingInfo.toggle()
                        }
                        withAnimation(.easeInOut(duration: 0.5)) {
                            show.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            dismiss()
                        }
                    }
            }
            .matchedGeometryEffect(id: selectedTransaction.id, in: animation)
        }
        .frame(width: screenWidth, height: screenWidth/headerAspectRatio)
        .background(Color(selectedTransaction.largeIcon.category.illustrationColor()))
    }

    @ViewBuilder
    func infoSection() -> some View {
        VStack(spacing: Spacing.medium) {
            VStack(spacing: Spacing.small) {
                Text(selectedTransaction.amountWithCurrency)
                    .font(Font(UIFont.heading1))
                    .foregroundColor(Color(.titleText))
                Text(selectedTransaction.name)
                    .font(Font(UIFont.defaultStrong))
                    .foregroundColor(Color(.titleText))
            }
            Text(selectedTransaction.formattedDate.capitalizedSentence)
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
                                          url: action == .changeAccount("",
                                            .clear) ? selectedTransaction.smallIcon.url : nil)
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
    @Namespace static var animation
    static var previews: some View {
        TransactionDetailView(screenWidth:  UIScreen.main.bounds.width,
                              headerAspectRatio: 375 / 224, quickActions: [
                                .changeAccount("", .black),
                                .accountShare,
                                    .like,
                                    .speakWithUs ],
                              selectedTransaction: .constant(Transaction.preview()),
                              show: .constant(false),
                              animation: animation)
    }
}
