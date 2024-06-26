//
//  MainView.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] 

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            ZStack {
                AppColors.purpleGradient.edgesIgnoringSafeArea(.all)
                if viewModel.isLoading{
                    ProgressView()
                }else{
                    TabView {
                        ForEach(viewModel.weatherData, id: \.locationName) { weatherData in
                            WeatherSummaryView(weatherData: weatherData)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
            }
            .navigationTitle("WeatherApp")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: NavigationLink(destination: MapIntegrationView(viewModel: viewModel), label: {
                    Image(systemName: "map").imageScale(.large)
                }),
                trailing: NavigationLink(destination: FavoriteView(viewModel: viewModel), label: {
                    Image(systemName: "plus").imageScale(.large)
                })
            ).accentColor(.white)
        }
        .onAppear {
            viewModel.requestWeather()
        }
    }
}

#Preview {
    MainView()
}
