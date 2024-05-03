//
//  WeatherSummaryView.swift
//  Weather
//
//  Created by Şehriban Yıldırım on 3.05.2024.
//

import SwiftUI

struct WeatherSummaryView: View {
    var body: some View {
        VStack{
            Text("Istanbul")
                .foregroundColor(.white)
                .font(Font.system(size: 32))
                .shadow(radius: 2.0)

            Text("18º")
                .foregroundColor(.white)
                .font(Font.system(size: 100))
                .fontWeight(.thin)
                .shadow(radius: 2.0)
            
            Text("Cloudy")
                .foregroundColor(.white)
                .font(Font.system(size: 18))
                .fontWeight(.medium)
                .shadow(radius: 2.0)
            
            Text("H:19º L:11º")
                .foregroundColor(.white)
                .font(Font.system(size: 18))
                .fontWeight(.medium)
                .shadow(radius: 2.0)
        }
    }
}

#Preview {
    ScrollView{
        HStack{
            Spacer()
            WeatherSummaryView()
            Spacer()
        }.padding(.top, 60)
    }
    .background(.blue)
}
