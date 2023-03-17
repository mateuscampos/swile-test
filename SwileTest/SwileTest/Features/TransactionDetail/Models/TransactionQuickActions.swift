//
//  TransactionQuickActions.swift
//  SwileTest
//
//  Created by Mateus de Campos on 16/03/23.
//

import UIKit

enum TransactionQuickActions: Hashable, Identifiable {

    var id: Self {
        return self
    }

    case changeAccount(_ iconName: String, _ illustrationColor: UIColor), accountShare, like, speakWithUs

    func imageName() -> String {
        switch self {
        case .changeAccount(let iconName, _):
            return iconName
        case .accountShare:
            return "action_share"
        case .like:
            return "action_like"
        case .speakWithUs:
            return "action_question"
        }
    }

    func iconBackgroundColor() -> UIColor {
        switch self {
        case .changeAccount(_, let illustrationColor):
            return illustrationColor
        default:
            return .illustrationGray
        }
    }

    func title() -> String {
        switch self {
        case .changeAccount(_, _):
            return "Titres-resto"
        case .accountShare:
            return "Partage d’addition"
        case .like:
            return "Aimer"
        case .speakWithUs:
            return "Signaler un problème"
        }
    }

    func action() -> String {
        switch self {
        case .changeAccount(_, _):
            return "Changer \nde compte"
        default:
            return ""
        }
    }

    func hasAction() -> Bool {
        return !self.action().isEmpty
    }
}

extension TransactionQuickActions: Equatable {
    static func == (lhs: TransactionQuickActions, rhs: TransactionQuickActions) -> Bool {
        switch (lhs, rhs) {
        case (.changeAccount, .changeAccount):
            return true
        default:
            return false
        }
    }
}
