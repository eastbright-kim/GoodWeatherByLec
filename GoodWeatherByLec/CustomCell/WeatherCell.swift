//
//  WeatherCell.swift
//  GoodWeatherByLec
//
//  Created by 김동환 on 2021/02/12.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func updateCell(vm: WeatherViewModel) {
        cityNameLabel.text = vm.name
        temperatureLabel.text = vm.currentTemperature.temp.doubleToString
    }
    
    
}
