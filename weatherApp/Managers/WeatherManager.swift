//
//  WeatherManager.swift
//  weatherApp
//
//  Created by Daniil Kim on 10.08.2024.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    func getCurrentWeather (latitude: CLLocationDegrees, longgitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longgitude)&appid=\("c5bbffaecd5074af617ac608b5baf6f7")&units=metric") else {
            fatalError("Missing URL")
        }
        let urlRequest = URLRequest(url:url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching data")
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

