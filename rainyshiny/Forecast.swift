//
//  Forecast.swift
//  rainyshiny
//
//  Created by Mac on 8/18/16.
//  Copyright © 2016 ElenaSidyakina. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    var _date: string!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return date
    }


var weatherType: String {
    if _weatherType == nil {
        _weatherType = ""
    }
    
    return _weatherType
}

var highTemp: String {
    if _highTemp == nil {
        _highTemp = ""
    }
    return _highTemp
}

var _lowTemp: String {
    if _lowTemp == nil {
        _lowTemp = ""
    }
    
    return _lowTemp
}

init(weatherDict: Dictionary<String, AnyObject>) {
    if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
        if let min = temp["min"] as? Double {
            
                let kelvinToFahrenheitPreDevision = (min * (9/5)-459.67)
                let kelvinToFahrenheit = Double(round(10 * kelvinToFahrenheitPreDevision/1))
                self._lowTemp = "\(kelvinToFahrenheit)"
        }
        
        if let max = temp["max"] as? Double<String, AnyObject> {
            let kelvinToFahrenheitPreDevision = (max * (9/5)-459.67)
            let kelvinToFahrenheit = Double(round(10 * kelvinToFahrenheitPreDevision/1))
            self._highTemp = "\(kelvinToFahrenheit)"
            
        }
        
    }
    if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
        if let main = weather[0]["main"] as? String {
            self._weatherType = main
        }
    }
    if let date = weatherDict["dt"] as? Double {
        let unixConvertedDate = Date(NSTimeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.timeStyle = .none
        self._date = unixConvertedDate.dayOfTheWeek()
    }
}
    
}


//an extention for date

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from:self)
    }
    
}

// we created a forecast class with variables we need for our data. We will download this data from the WeatherVC


