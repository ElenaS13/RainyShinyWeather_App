//
//  CurrentWeather.swift
//  rainyshiny
//
//  Created by Mac on 8/16/16.
//  Copyright © 2016 ElenaSidyakina. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
//Below is data encapsulation. We make sure that no one else/no other apps access the data above
    
    var cityName: string {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        //we save current date in the below constant
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
        
    }
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        //initialize URL to tell Alamofire where to download from
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        //the below will say "I want to download files from the given url"
        Alamofire.request(.GET, currentWeatherURL).responseJSON {
        //after the request, we need to know what the result is
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalize
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalize
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        let kelvinToFahrenheitPreDevision = (currentTemperature * (9/5)-459.67)
                        let kelvinToFahrenheit = Double(round(10 * kelvinToFahrenheitPreDevision/1))
                        self._currentTemp = kelvinToFahrenheit
                    }
                }
            }
            
            
        }
        //name of function to tell it when it is done
        completed()
        
        
    }
}
