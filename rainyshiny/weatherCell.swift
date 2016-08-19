//
//  weatherCell.swift
//  rainyshiny
//
//  Created by Mac on 8/18/16.
//  Copyright © 2016 ElenaSidyakina. All rights reserved.
//

import UIKit

class weatherCell: UITableViewCell {
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLbl: UILable!
    @IBOutlet weak var weatherType: UILable!
    @IBOutlet weak var highTemp: UILable!
    @IBOutlet weak var lowTemp: UILable!
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLbl.text = forecast.date
    }

}
