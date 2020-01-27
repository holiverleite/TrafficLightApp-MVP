//
//  TrafficLightService.swift
//  TrafficLight
//
//  Created by monitora on 27/01/20.
//  Copyright © 2020 Haroldo Leite. All rights reserved.
//

import Foundation

class TrafficLightService {
    
    func getTrafficLight(colorName: String, callback: (TrafficLight?) -> Void) {
        
        let trafficLights = [
            TrafficLight(colorName: "Red", description: "Stop"),
            TrafficLight(colorName: "Green", description: "Go"),
            TrafficLight(colorName: "Yellow", description: "Wait")
        ]
        
        if let foundTrafficLight = trafficLights.first(where: { (trafficLight) -> Bool in
            return trafficLight.colorName == colorName
        }) {
            callback(foundTrafficLight)
        } else {
            callback(nil)
        }
    }
}
