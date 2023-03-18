//
//  TransactionQuickActionsTests.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 17/03/23.
//

import Foundation

import XCTest
@testable import SwileTest

class TransactionQuickActionsTests: XCTestCase {

    func testImageName() {
        let changeAccountAction = TransactionQuickActions.changeAccount("icon_name", .illustrationOrange)
        XCTAssertEqual(changeAccountAction.imageName(), "icon_name")

        let accountShareAction = TransactionQuickActions.accountShare
        XCTAssertEqual(accountShareAction.imageName(), "action_share")

        let likeAction = TransactionQuickActions.like
        XCTAssertEqual(likeAction.imageName(), "action_like")

        let speakWithUsAction = TransactionQuickActions.speakWithUs
        XCTAssertEqual(speakWithUsAction.imageName(), "action_question")
    }

    func testIconBackgroundColor() {
        let changeAccountAction = TransactionQuickActions.changeAccount("icon_name", .illustrationOrange)
        XCTAssertEqual(changeAccountAction.iconBackgroundColor(), .illustrationOrange)

        let accountShareAction = TransactionQuickActions.accountShare
        XCTAssertEqual(accountShareAction.iconBackgroundColor(), .illustrationGray)

        let likeAction = TransactionQuickActions.like
        XCTAssertEqual(likeAction.iconBackgroundColor(), .illustrationGray)

        let speakWithUsAction = TransactionQuickActions.speakWithUs
        XCTAssertEqual(speakWithUsAction.iconBackgroundColor(), .illustrationGray)
    }

    func testTitle() {
        let changeAccountAction = TransactionQuickActions.changeAccount("icon_name", .illustrationOrange)
        XCTAssertEqual(changeAccountAction.title(), "Titres-resto")

        let accountShareAction = TransactionQuickActions.accountShare
        XCTAssertEqual(accountShareAction.title(), "Partage d’addition")

        let likeAction = TransactionQuickActions.like
        XCTAssertEqual(likeAction.title(), "Aimer")

        let speakWithUsAction = TransactionQuickActions.speakWithUs
        XCTAssertEqual(speakWithUsAction.title(), "Signaler un problème")
    }

    func testAction() {
        let changeAccountAction = TransactionQuickActions.changeAccount("icon_name", .illustrationOrange)
        XCTAssertEqual(changeAccountAction.action(), "Changer \nde compte")

        let accountShareAction = TransactionQuickActions.accountShare
        XCTAssertEqual(accountShareAction.action(), "")

        let likeAction = TransactionQuickActions.like
        XCTAssertEqual(likeAction.action(), "")

        let speakWithUsAction = TransactionQuickActions.speakWithUs
        XCTAssertEqual(speakWithUsAction.action(), "")
    }

    func testHasAction() {
        let changeAccountAction = TransactionQuickActions.changeAccount("icon_name", .illustrationOrange)
        XCTAssertTrue(changeAccountAction.hasAction())

        let accountShareAction = TransactionQuickActions.accountShare
        XCTAssertFalse(accountShareAction.hasAction())

        let likeAction = TransactionQuickActions.like
        XCTAssertFalse(likeAction.hasAction())

        let speakWithUsAction = TransactionQuickActions.speakWithUs
        XCTAssertFalse(speakWithUsAction.hasAction())
    }
}
