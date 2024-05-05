//
//  CityAnnotation.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 5.05.2024.
//

import Foundation
import CoreLocation

struct CityAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let temperature: Double
    let weatherIcon: String
}
