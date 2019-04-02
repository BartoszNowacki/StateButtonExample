//
//  StateButton.swift
//  StateButtonExample
//
//  Created by Bartosz Nowacki on 01/04/2019.
//  Copyright © 2019 Bartosz Nowacki. All rights reserved.
//

import UIKit


/// Delegate protocol for StateButton. It has 2 functions.
/// -stateButtonBeforeChange - called when touch event on stateButton is detected. State change will start afterwards
/// -stateButtonAfterChange - called when state of button was changed.
protocol StateButtonDelegate: class {
    func stateButtonBeforeChange(_ sender: StateButton, _ id: Int)
    func stateButtonAfterChange(_ sender: StateButton, _ id: Int)
}


/// Model for StateData
fileprivate struct StateData {
    let color: UIColor
    let text: String
}

class StateButton: UIControl {
    
    private var states: [StateData]?
    weak var delegate: StateButtonDelegate?
    private var id: Int = 0  /// id of current state
    let label = UILabel()
    
    
    /// Initializer function for StateButton. It cann't be used directly. You have to use StateButtonBuilder class
    fileprivate init(_ frame: CGRect,_ delegate: StateButtonDelegate?, _ states: [StateData]) {
        super.init(frame: frame)
        self.states = states
        self.delegate = delegate
        addLabel()
        updateView()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        delegate?.stateButtonBeforeChange(self, id)
        changeState()
        delegate?.stateButtonAfterChange(self, id)
    }
    
    
    /// Adds configured label to the view
    private func addLabel() {
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.textColor = .black
        label.textAlignment = .center
        self.addSubview(label)
    }
    
    
    /// Update View with state of current id
    private func updateView() {
        if let state = states?[id] {
            label.text = state.text
            self.backgroundColor = state.color
        }
    }
    
    
    /// Update id of current state
    private func changeState() {
        if id != states!.count - 1 {
            id += 1
        } else {
            id = 0
        }
        updateView()
    }
    
}

/// Builder class for StateButton
class StateButtonBuilder {
    fileprivate var states = [StateData]()
    var delegate: StateButtonDelegate?
    let frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    
    /// Add delegate to stateButton. If it's not provided, the delegate method will not work
    func addDelegate(_ delegate: StateButtonDelegate) -> StateButtonBuilder {
        self.delegate = delegate
        return self
    }
    
    
    /// Add state to the StateButton with given color and text
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
