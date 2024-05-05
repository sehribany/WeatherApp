//
//  WeatherSummaryView.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import SwiftUI

struct WeatherSummaryView: View {
    var weatherData: WeatherData
    var body: some View {
        VStack(spacing: 20) {
            Text(weatherData.locationName)
                .font(.title).bold()
            
            Text("\(weatherData.temperature)")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Text(weatherData.condition)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Text("H: \(weatherData.highTemp) L: \(weatherData.lowTemp)")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 40)
    }
}
