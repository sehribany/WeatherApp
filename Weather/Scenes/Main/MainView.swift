//
//  MainView.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView{
            VStack{
                WeatherSummaryView()
                    .padding(.top,60)
                    .padding(.bottom, 40)
            }
            .padding(.horizontal)
        }
        .background(.blue)
    }
}

#Preview {
    MainView()
}
