//
//  ImagesManager.swift
//  weatherApp
//
//  Created by Daniil Kim on 10.08.2024.
//

import Foundation
import SwiftUI

//Images

enum WeatherImages: String{
    case sun = "SunWeather"
    case cloud = "CloudWeather"
    case rain = "RainWeather"
    case storm = "StormWeather"
    case snow = "SnowWeather"
    case regular = "DefaultWeather"
    
    var image: Image! {
        return Image(rawValue)
        }
}

func getWeatherImage(for weather: ResponseBody) -> Image {
    guard let mainWeather = weather.weather.first?.main else {
        return WeatherImages.regular.image
    }
    
    switch mainWeather {
    case "Clouds":
        return WeatherImages.cloud.image
    case "Clear":
        return WeatherImages.sun.image
    case "Rain":
        return WeatherImages.rain.image
    case "Drizzle":
        return WeatherImages.rain.image
    case "Thunderstorm":
        return WeatherImages.storm.image
    case "Snow":
        return WeatherImages.snow.image
    default:
        return WeatherImages.regular.image
    }
}

//SFSymbols

enum SFWeatherImages: String {
    case sun = "sun.max"
    case cloud = "cloud"
    case rain = "cloud.drizzle"
    case storm = "cloud.bolt"
    case snow = "cloud.snow"
    case regular = "rainbow"
    
    var sfImage: Image {
        return Image(systemName: rawValue)
    }
}

func getSFWeatherImage(for weather: ResponseBody) -> Image {
    guard let mainWeather = weather.weather.first?.main else {
        return SFWeatherImages.regular.sfImage
    }
    
    switch mainWeather {
    case "Clouds":
        return SFWeatherImages.cloud.sfImage
    case "Clear":
        return SFWeatherImages.sun.sfImage
    case "Rain":
        return SFWeatherImages.rain.sfImage
    case "Drizzle":
        return SFWeatherImages.rain.sfImage
    case "Thunderstorm":
        return SFWeatherImages.storm.sfImage
    case "Snow":
        return SFWeatherImages.snow.sfImage
    default:
        return SFWeatherImages.regular.sfImage
    }
}
