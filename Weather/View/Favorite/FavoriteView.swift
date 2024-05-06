//
//  FavoriteView.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 10) {
            SearchBar(text: $viewModel.searchText, onSearch: {
                viewModel.searchWeather(for: viewModel.searchText)
            })
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    VStack {
                        if let weather = viewModel.currentWeather {
                            WeatherCell(weather: weather)
                        }
                        ForEach(viewModel.weatherData, id: \.locationName) { weather in
                            WeatherCell(weather: weather)
                        }
                    }
                    .background(.clear)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(.appBlack)
        .navigationTitle("Favorite")
        .navigationBarItems(leading: Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
        })
    }
}
