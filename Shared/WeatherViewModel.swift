//
//  WeatherViewModel.swift
//  Mobile
//
//  Created by Guest User on 05/05/2021.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published private(set) var model: WeatherModel = WeatherModel(cities: ["London", "Cracow", "Venice", "Roma"])
    
    var records: Array<WeatherModel.WeatherRecord> {
        model.records
    }
    
    func refresh(record: WeatherModel.WeatherRecord) {
        model.refresh(record: record)
    }
    
    
    func getIcon(record: WeatherModel.WeatherRecord) -> String {
        switch record.weatherState {
        case "Snow":
            return "🌨"
        case "Heavy Rain":
            return "🌧"
        case "Sleet":
            return "🌨"
        case "Thunderstom":
            return "🌪"
        case "Light Rain":
            return "🌧"
        case "Showers":
            return ""
        case "Heavy Cloud":
            return "🌥"
        case "Light Cloud":
            return "🌤"
        default:
            return "☀️"
        }
    }
}
