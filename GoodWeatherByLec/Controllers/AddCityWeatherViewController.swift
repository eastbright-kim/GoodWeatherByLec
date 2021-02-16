//
//  AddCityWeatherViewController.swift
//  GoodWeatherByLec
//
//  Created by 김동환 on 2021/02/12.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeather(vm: WeatherViewModel)
}

class AddCityWeatherViewController: UIViewController {
    
    private var addCityViewModel = AddCityViewModel()
    
    @IBOutlet weak var cityNameTextLabel: BindingTextField! {
        didSet {
            cityNameTextLabel.bind { city in
                self.addCityViewModel.city = city
            }
        }
    }
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind { (state) in
                self.addCityViewModel.state = state
            }
        }
    }
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            zipCodeTextField.bind { (zipCode) in
                self.addCityViewModel.zipCode = zipCode
            }
        }
    }
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        
        if let cityName = cityNameTextLabel.text {
            
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=e61267c07543e45b46ba83f54ac8fb03&units=imperial")!
            
            let resource = Resource<WeatherViewModel>(url: url){ result in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: result)
                return weatherVM
            }
            
            Webservice().load(resource: resource) { weathervm in
                
                if let vm = weathervm {
                    if let delegate = self.delegate {
                        delegate.addWeather(vm: vm)
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }

        @IBAction func closeButtonPressed(){
            self.dismiss(animated: true, completion: nil)
        }
    }
