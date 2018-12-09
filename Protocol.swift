//
//  Protocol.swift
//  Photo Viewer Project
//
//  Created by Student on 5/5/17.
//  Copyright © 2017 John Buckner. All rights reserved.
//

import Foundation

protocol SettingsDelegate {
    func updateSettings(controller: AnyObject, newSettings: Settings)
}
