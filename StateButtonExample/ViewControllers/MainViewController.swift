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
    
    // MARK: - Lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstStateButton = addStateButton(with: 3)
        secondStateButton = addStateButton(with: 4)
    }
    
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        firstStateButton!.frame = CGRect(x: margin, y: margin + view.safeAreaInsets.top,
                                           width: width, height: 31.0)
        secondStateButton!.frame = CGRect(x: margin, y: (firstStateButton?.frame.midY)! + margin,
                                         width: width, height: 31.0)
    }
    
    // MARK: - ViewController functions
    
    /// Adds new instance of StateButton, with colors from array list, and their string representation as a text. It also adds this istance as a subview of view.
    /// - parameters: amount - amount of states you want to have
    /// - returns: StateButton instance.
    
    private func addStateButton(with amount: Int) -> StateButton {
        let colors: [UIColor] = [.blue, .red, .green, .yellow]
        let builder = StateButtonBuilder().addDelegate(self)
        for index in 1...amount {
            let color = colors[index-1]
            builder.addState(color: color, text: ColorConverter.getColor(color))
        }
        let stateButton = builder.build()
        view.addSubview(stateButton)
        return stateButton
    }
    
    // MARK: - Delegate functions
    
    func stateButtonBeforeChange(_ sender: StateButton, _ id: Int) {
        print("State is about to change! with sender \(sender) and id \(id)")
    }
    
    func stateButtonAfterChange(_ sender: StateButton, _ id: Int) {
        print("State is changed! with sender \(sender) and id \(id)")
    }
}
