//
//  Constants.swift
//  rainyshiny
//
//  Created by Mac on 8/16/16.
//  Copyright © 2016 ElenaSidyakina. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "3cf010869ce058fb0f2e984f145e11a3"
//the below will tell our function when the download is complete
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

//Now, we need to create a class to store our weather data. We will create a separate file CurrentWeather.swift


let FORECAST_URL = "http://api.openweathermap.org/data/2.5/weather?"
