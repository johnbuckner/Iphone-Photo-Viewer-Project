//
//  SettingsViewController.swift
//  Photo Viewer Project
//
//  Created by Student on 5/5/17.
//  Copyright © 2017 John Buckner. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var switchCanyons: UISwitch!
    @IBOutlet weak var switchFauna: UISwitch!
    @IBOutlet weak var switchFlora: UISwitch!
    @IBOutlet weak var switchMountains: UISwitch!
    @IBOutlet weak var switchPanoramas: UISwitch!
    @IBOutlet weak var switchRuins: UISwitch!
    
    var appSettings = Settings()
    var delegate: SettingsDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switchCanyons.setOn(appSettings.canyonsSetting, animated: animated)
        switchFauna.setOn(appSettings.faunaSetting, animated: animated)
        switchFlora.setOn(appSettings.floraSetting, animated: animated)
        switchMountains.setOn(appSettings.mountainsSetting, animated: animated)
        switchPanoramas.setOn(appSettings.panoramasSetting, animated: animated)
        switchRuins.setOn(appSettings.ruinsSetting, animated: animated)

        
        switchCanyons.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        switchFauna.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        switchFlora.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        switchMountains.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        switchPanoramas.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        switchRuins.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
    }
    
    func switchValueDidChange(_ sender: UISwitch!)
    {
        if sender.isOn {
            switch sender.accessibilityIdentifier! {
            case "Canyons": appSettings.includeCategory(sender.accessibilityIdentifier!)
            case "Fauna": appSettings.includeCategory(sender.accessibilityIdentifier!)
            case "Flora": appSettings.includeCategory(sender.accessibilityIdentifier!)
            case "Mountains": appSettings.includeCategory(sender.accessibilityIdentifier!)
            case "Panoramas": appSettings.includeCategory(sender.accessibilityIdentifier!)
            case "Ruins": appSettings.includeCategory(sender.accessibilityIdentifier!)
            default:    break
            }
        } else {
            switch sender.accessibilityIdentifier! {
            case "Canyons": appSettings.excludeCategory(sender.accessibilityIdentifier!)
            case "Fauna": appSettings.excludeCategory(sender.accessibilityIdentifier!)
            case "Flora": appSettings.excludeCategory(sender.accessibilityIdentifier!)
            case "Mountains": appSettings.excludeCategory(sender.accessibilityIdentifier!)
            case "Panoramas": appSettings.excludeCategory(sender.accessibilityIdentifier!)
            case "Ruins": appSettings.excludeCategory(sender.accessibilityIdentifier!)
            default:    break
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate!.updateSettings(controller: self, newSettings: appSettings)
    }
}
