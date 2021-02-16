//
//  Double+Extensions.swift
//  GoodWeatherByLec
//
//  Created by 김동환 on 2021/02/12.
//

import Foundation

extension Double {
  
    var doubleToString: String {
        return String(format: "%.0f°", self)
    }
    
}
