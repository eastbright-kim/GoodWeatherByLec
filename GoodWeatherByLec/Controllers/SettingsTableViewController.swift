//
//  SettingsTableViewController.swift
//  GoodWeatherByLec
//
//  Created by 김동환 on 2021/02/12.
//

import Foundation
import UIKit

protocol SettingDone {
    func unitSetting(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    
    var delegate: SettingDone?
    var settingsVM = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        cell.textLabel?.text = settingsVM.units[indexPath.row].selectedUnit
        
        if settingsVM.units[indexPath.row] == settingsVM.selectedUnit {
            cell.accessoryType = .checkmark
        }
           
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingsVM.selectedUnit = unit
        }
        
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        settingsVM.selectedUnit = settingsVM.units[indexPath.row]
        
    
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    
    @IBAction func doneButtonPressed () {
        
        if let delegate = self.delegate {
            delegate.unitSetting(vm: self.settingsVM)
        }
        self.dismiss(animated: true, completion: nil)
    }
}

