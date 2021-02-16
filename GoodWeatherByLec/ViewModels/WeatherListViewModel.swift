//
//  WeatherListViewModel.swift
//  GoodWeatherByLec
//
//  Created by 김동환 on 2021/02/12.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherListViewModel = [WeatherViewModel]()
    
    func numberOfRows(_section: Int) -> Int{
        return weatherListViewModel.count
    }
    
    func weatherViewModel(at index: Int) -> WeatherViewModel {
        return weatherListViewModel[index]
    }
    
    mutating func addViewModel(vm: WeatherViewModel) {
        weatherListViewModel.append(vm)
    }
    
    mutating func setUnit(vm: SettingsViewModel) {
        switch vm.selectedUnit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    mutating func toCelsius(){
        weatherListViewModel = weatherListViewModel.map { vm in
            var vm = vm
            vm.currentTemperature.temp = (vm.currentTemperature.temp - 32) * 5/9
            return vm
        }
    }
    
    mutating func toFahrenheit(){
        weatherListViewModel = weatherListViewModel.map {vm in
            
            var vm = vm
            vm.currentTemperature.temp = (vm.currentTemperature.temp * 9/5) + 32
            return vm
        }
    }
    
    
}


struct WeatherViewModel: Decodable {
    let name: String
    var currentTemperature: Main
    
    private enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case currentTemperature = "main"
    }
}

struct Main: Decodable {
    var temp: Double
}
