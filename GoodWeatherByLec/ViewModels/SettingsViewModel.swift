//
//  SettingsViewModel.swift
//  GoodWeatherByLec
//
//  Created by 김동환 on 2021/02/12.
//

import Foundation

enum Unit: String, CaseIterable {
    
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var selectedUnit: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

struct SettingsViewModel{
    
    let units = Unit.allCases
    
    var _selectedUnit = Unit.fahrenheit
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let selectedUnit = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: selectedUnit)!
            }
            return _selectedUnit
        }
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
