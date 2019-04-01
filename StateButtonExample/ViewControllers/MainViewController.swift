//
//  ViewController.swift
//  StateButtonExample
//
//  Created by Bartosz Nowacki on 01/04/2019.
//  Copyright © 2019 Bartosz Nowacki. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, StateButtonDelegate {
    
    var firstStateButton: StateButton?
    var secondStateButton: StateButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFirstStateButton()
        addSecondStateButton()
    }
    
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        firstStateButton!.frame = CGRect(x: margin, y: margin + view.safeAreaInsets.top,
                                           width: width, height: 31.0)
        secondStateButton!.frame = CGRect(x: margin, y: (firstStateButton?.frame.midY)! + margin,
                                         width: width, height: 31.0)
    }
    
    private func addFirstStateButton() {
        firstStateButton = StateButtonBuilder()
            .addDelegate(self)
            .addState(color: .blue, text: "First")
            .addState(color: .green, text: "Second")
            .addState(color: .yellow, text: "Third")
            .build()
        view.addSubview(firstStateButton!)
    }
    
    private func addSecondStateButton() {
        secondStateButton = StateButtonBuilder()
            .addDelegate(self)
            .addState(color: .blue, text: "First")
            .addState(color: .green, text: "Second")
            .addState(color: .yellow, text: "Third")
            .addState(color: .red, text: "Fourth")
            .build()
        view.addSubview(secondStateButton!)
    }
    
    func stateButtonBeforeChange(_ sender: StateButton, _ id: Int) {
        print("State is about to change! with sender \(sender) and id \(id)")
    }
    
    func stateButtonAfterChange(_ sender: StateButton, _ id: Int) {
        print("State is changed! with sender \(sender) and id \(id)")
    }
}
