//
//  WeatherNetworkManager.swift
//  WeatherDarkMode
//
//  Created by admin on 2020-05-01.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class WeatherNetworkManager : NetworkManagerProtocol {
    func fetchNextFiveWeatherForecast(city: String, completion: @escaping (ForecastModel) -> ()) {
        let formattedCity = city.replacingOccurrences(of: " ", with: "+")
        let API_URL = "http://api.openweathermap.org/data/2.5/forecast?q=\(formattedCity)&appid=\(NetworkProperties.API_KEY)"
        guard let url = URL(string: API_URL) else {
            fatalError()
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard let data = data else { return }

            do {
                let forecastModel = try JSONDecoder().decode(ForecastModel.self, from: data)
                completion(forecastModel)
            } catch {
                 print(error)
            }

        }.resume()
    }
    
  //3 protocol methods will appear here
    func fetchCurrentWeather(city: String, completion: @escaping (WeatherModel) -> ()) {
        let formattedCity = city.replacingOccurrences(of: " ", with: "+")
        let API_URL = "https://api.openweathermap.org/data/2.5/weather?q=\(formattedCity)&appid=\(NetworkProperties.API_KEY)"

        guard let url = URL(string: API_URL) else {
            fatalError()
        }
                     
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard let data = data else { return }

            do {
                let currentWeather = try JSONDecoder().decode(WeatherModel.self, from: data)
                completion(currentWeather)
            } catch {
                 print(error)
            }

        }.resume()
    }
    
    func fetchCurrentLocationWeather(lat: String, lon: String, completion: @escaping (WeatherModel) -> ()) {
        //
    }
    
    
}
