//
//  FavoriteView.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel : MainViewModel

    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText, onSearch: {
                viewModel.searchWeather(for: viewModel.searchText)
            })
            if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    if let weather = viewModel.currentWeather {
                        WeatherCell(weather: weather)
                    }
                    ForEach(viewModel.weatherData, id: \.locationName) { weather in
                                            WeatherCell(weather: weather)
                                        }
                }
            }
        }
    }
}


