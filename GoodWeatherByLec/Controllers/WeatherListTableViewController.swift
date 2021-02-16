//
//  WeatherListTableViewController.swift
//  GoodWeatherByLec
//
//  Created by 김동환 on 2021/02/12.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate, SettingDone{
    
    func unitSetting(vm: SettingsViewModel) {
        weatherListViewModel.setUnit(vm: vm)
        self.tableView.reloadData()
    }
    
    
    func addWeather(vm: WeatherViewModel) {
        weatherListViewModel.addViewModel(vm: vm)
        self.tableView.reloadData()
    }
    
    
    private var weatherListViewModel = WeatherListViewModel()
    let settingsVM = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(_section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else {
            fatalError()
        }
        cell.updateCell(vm: weatherListViewModel.weatherViewModel(at: indexPath.row))
        //문제 - add하고 메인으로 돌아올 때, 무조건 fahrenhiet로 뜸. -> 메인의 테이블뷰가 유저 디폴트를 따르지 않음
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityViewController" {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError()
            }
            guard let destinationVC =  nav.viewControllers.first as? AddCityWeatherViewController else {
                fatalError()
            }
            destinationVC.delegate = self
            
        } else if segue.identifier == "SettingsTableViewController" {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError()
            }
            guard let destinationVC =  nav.viewControllers.first as? SettingsTableViewController else {
                fatalError()
            }
            destinationVC.delegate = self
        }
        
    }
}
