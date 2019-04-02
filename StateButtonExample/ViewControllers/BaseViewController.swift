//
//  BaseViewController.swift
//  StateButtonExample
//
//  Created by Bartosz Nowacki on 02/04/2019.
//  Copyright © 2019 Bartosz Nowacki. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
//    var firstStateButton: StateButton = addStateButton()
//    var secondStateButton: StateButton = addStateButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//
//    override func viewDidLayoutSubviews() {
//        let margin: CGFloat = 20.0
//        let width = view.bounds.width - 2.0 * margin
//        firstStateButton.frame = CGRect(x: margin, y: margin + view.safeAreaInsets.top,
//                                        width: width, height: 31.0)
//        secondStateButton.frame = CGRect(x: margin, y: (firstStateButton?.frame.midY)! + margin,
//                                         width: width, height: 31.0)
//    }
//
//    private func addStateButton() -> StateButton {
//        let stateButton = StateButtonBuilder()
//            .addDelegate(self)
//            .addState(color: .blue, text: "First")
//            .addState(color: .green, text: "Second")
//            .addState(color: .yellow, text: "Third")
//            .build()
//        view.addSubview(stateButton)
//        return firstStateButton
//    }
//
//    private func addSecondStateButton() {
//        let stateButton = StateButtonBuilder()
//            .addDelegate(self)
//            .addState(color: .blue, text: "First")
//            .addState(color: .green, text: "Second")
//            .addState(color: .yellow, text: "Third")
//            .addState(color: .red, text: "Fourth")
//            .build()
//        view.addSubview(stateButton!)
//    }
//
//    func stateButtonBeforeChange(_ sender: StateButton, _ id: Int) {
//        print("State is about to change! with sender \(sender) and id \(id)")
//    }
//
//    func stateButtonAfterChange(_ sender: StateButton, _ id: Int) {
//        print("State is changed! with sender \(sender) and id \(id)")
//    }
}

