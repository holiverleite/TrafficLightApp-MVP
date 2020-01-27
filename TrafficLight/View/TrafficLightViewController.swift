//
//  TrafficLightViewController.swift
//  TrafficLight
//
//  Created by monitora on 27/01/20.
//  Copyright © 2020 Haroldo Leite. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var greenButton: UIButton! {
        didSet {
            self.greenButton.setTitle("Green", for: .normal)
            self.greenButton.setTitleColor(.green, for: .normal)
            self.greenButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var yellowButton: UIButton! {
        didSet {
            self.yellowButton.setTitle("Yellow", for: .normal)
            self.yellowButton.setTitleColor(.yellow, for: .normal)
            self.yellowButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var redButton: UIButton! {
        didSet {
            self.redButton.setTitle("Red", for: .normal)
            self.redButton.setTitleColor(.red, for: .normal)
            self.redButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var outputLabel: UILabel! {
        didSet {
            self.outputLabel.text = ""
        }
    }
    
    // MARK: - Variables
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }
    
    @objc func didTapButton(_ sender: Any) {
        if let senderButton = sender as? UIButton {
            switch senderButton {
            case self.greenButton:
                self.trafficLightPresenter.trafficLightColorSelected(colorName: "Green")
            case self.yellowButton:
                self.trafficLightPresenter.trafficLightColorSelected(colorName: "Yellow")
            case self.redButton:
                self.trafficLightPresenter.trafficLightColorSelected(colorName: "Red")
            default:
                break
            }
        }
    }
}

extension TrafficLightViewController: TrafficLightViewDelegate {
    func displayTrafficLight(description: String) {
        self.outputLabel.text = description
    }
}

