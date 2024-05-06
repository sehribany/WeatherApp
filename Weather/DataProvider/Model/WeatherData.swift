//
//  WeatherData.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 5.05.2024.
//

import Foundation
import CoreLocation

struct WeatherData {
    let locationName: String
    let temperature: Double
    let condition: String
    let highTemp: Double
    let lowTemp: Double
    var coordinate: CLLocationCoordinate2D
    var icon: String
}
