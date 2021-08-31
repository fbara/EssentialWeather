//
//  ForecastViewModel.swift
//  ForecastViewModel
//
//  Created by Frank Bara on 8/31/21.
//

import Foundation

struct ForecastViewModel {
    let forecast: Forecast.Daily
    
    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM, d"
        return dateFormatter
    }
    
    private static var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }
    
    private static var numberFormatter2: NumberFormatter {
        let numberFormatter2 = NumberFormatter()
        numberFormatter2.numberStyle = .percent
        return numberFormatter
    }
    
    var day: String {
        return Self.dateFormatter.string(from: forecast.dt)
    }
    
    var overview: String {
        forecast.weather[0].description.capitalized
    }
    
    var high: String {
        return "H: \(Self.numberFormatter.string(for: forecast.temp.max) ?? "0")°"
    }
    
    var low: String {
        return "H: \(Self.numberFormatter.string(for: forecast.temp.min) ?? "0")°"
    }
    
    var precip: String {
        return "💧 \(Self.numberFormatter2.string(for: forecast.pop) ?? "0%")"
    }
    
    var clouds: String {
        return "☁️ \(forecast.clouds)%"
    }
    
    var humidity: String {
        return "Humidity: \(forecast.humidity)%"
    }
}