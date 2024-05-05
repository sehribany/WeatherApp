//
//  MainView.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        NavigationView {
            TabView {
                ForEach(viewModel.weatherData, id: \.locationName) { weatherData in
                    WeatherSummaryView(weatherData: weatherData)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .navigationTitle("WeatherApp")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    NavigationLink(destination: MapIntegrationView(viewModel: viewModel), label: {
                        Image(systemName: "map").imageScale(.large)}),
                trailing:
                    NavigationLink(destination: FavoriteView(viewModel: viewModel), label: {
                        Image(systemName: "plus").imageScale(.large)})).accentColor(.primary)
        }
        .onAppear {
            viewModel.requestWeather()
        }
    }
}

#Preview {
    MainView()
}
