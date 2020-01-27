//
//  TrafficLightPresenter.swift
//  TrafficLight
//
//  Created by monitora on 27/01/20.
//  Copyright © 2020 Haroldo Leite. All rights reserved.
//

import Foundation

protocol TrafficLightViewDelegate: NSObjectProtocol {
    func displayTrafficLight(description: String)
}

class TrafficLightPresenter {
    private let trafficLightService: TrafficLightService
    weak private var trafficLightViewDelegate: TrafficLightViewDelegate?
    
    init(trafficLightService: TrafficLightService) {
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate: TrafficLightViewDelegate?) {
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    func trafficLightColorSelected(colorName: String) {
        self.trafficLightService.getTrafficLight(colorName: colorName) { (trafficLight) in
            guard let trafficLight = trafficLight else {
                return
            }
            
            self.trafficLightViewDelegate?.displayTrafficLight(description: trafficLight.description)
        }
    }
}
