//
//  WeatherView.swift
//  weatherApp
//
//  Created by Daniil Kim on 10.08.2024.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20){
                            getSFWeatherImage(for: weather)
                                .font(.system(size: 40))
                            
                            Text(weather.weather [0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    getWeatherImage(for: weather)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: weather.main.temp_min.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: weather.main.temp_max.roundDouble() + "°")
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(.black))
            .preferredColorScheme(.dark)
        }
    }
    
    #Preview {
        WeatherView(weather: previewWeather)
}

