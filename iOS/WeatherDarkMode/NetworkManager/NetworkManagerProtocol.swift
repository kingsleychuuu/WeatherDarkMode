//
//  NetworkManagerProtocol.swift
//  WeatherDarkMode
//
//  Created by admin on 2020-05-01.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchCurrentWeather(city: String, completion: @escaping (WeatherModel) -> ())
    func fetchCurrentLocationWeather(lat: String, lon: String, completion: @escaping (WeatherModel) -> ())
    func fetchNextFiveWeatherForecast(city: String, completion: @escaping (ForecastModel) -> ())
}
