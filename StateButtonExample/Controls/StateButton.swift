//
//  StateButton.swift
//  StateButtonExample
//
//  Created by Bartosz Nowacki on 01/04/2019.
//  Copyright © 2019 Bartosz Nowacki. All rights reserved.
//

import UIKit

protocol StateButtonDelegate: class {
    func stateButtonBeforeChange(_ sender: StateButton, _ id: Int)
    func stateButtonAfterChange(_ sender: StateButton, _ id: Int)
}

fileprivate struct StateData {
    let color: UIColor
    let text: String
}

class StateButton: UIControl {
    
    fileprivate var states: [StateData]?
    weak var delegate: StateButtonDelegate?
    private var id: Int = 0
    let label = UILabel()
    
    fileprivate init(_ frame: CGRect,_ delegate: StateButtonDelegate?, _ states: [StateData]) {
        super.init(frame: frame)
        self.states = states
        self.delegate = delegate
        addLabel()
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        delegate?.stateButtonBeforeChange(self, id)
        changeState()
        delegate?.stateButtonAfterChange(self, id)
    }
    
    private func addLabel() {
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.textColor = .black
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    private func updateView() {
        if let state = states?[id] {
            label.text = state.text
            self.backgroundColor = state.color
        }
    }
    
    private func changeState() {
        if id != states!.count - 1 {
            id += 1
        } else {
            id = 0
        }
        updateView()
    }
    
}

class StateButtonBuilder {
    fileprivate var states = [StateData]()
    var delegate: StateButtonDelegate?
    let frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    func addDelegate(_ delegate: StateButtonDelegate) -> StateButtonBuilder {
        self.delegate = delegate
        return self
    }
    
    func addState(color: UIColor, text: String) -> StateButtonBuilder {
        self.states.append(StateData(color: color, text: text))
        return self
    }
    
    func build() -> StateButton {
        if states.count != 0 {
            return StateButton(frame, delegate, states)
        } else {
            fatalError("There must be at least 1 state")
        }
    }
}
