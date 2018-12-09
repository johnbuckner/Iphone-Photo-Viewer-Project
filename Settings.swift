//
//  Settings.swift
//  Photo Viewer Project
//
//  Created by Student on 5/5/17.
//  Copyright © 2017 John Buckner. All rights reserved.
//

import Foundation

struct Settings
{
    
    private var canyons = true
    private var fauna = false
    private var flora = false
    private var mountains = false
    private var panoramas = false
    private var ruins = false
    
    mutating func includeCategory(_ categoryType: String)
    {
        switch categoryType {
        case "Canyons":     canyons = true
        case "Fauna":       fauna = true
        case "Flora":       flora = true
        case "Mountains":   mountains = true
        case "Panoramas":   panoramas = true
        case "Ruins":       ruins = true
        default:            break
        }
    }
    
    mutating func excludeCategory(_ categoryType: String)
    {
        switch categoryType {
        case "Canyons":     canyons = false
        case "Fauna":       fauna = false
        case "Flora":       flora = false
        case "Mountains":   mountains = false
        case "Panoramas":   panoramas = false
        case "Ruins":       ruins = false
        default:            break
        }
    }
    
    var canyonsSetting: Bool { get { return canyons } set { canyons = newValue }}
    var faunaSetting: Bool { get { return fauna } set { fauna = newValue }}
    var floraSetting: Bool { get { return flora } set { flora = newValue }}
    var mountainsSetting: Bool { get { return mountains } set { mountains = newValue }}
    var panoramasSetting: Bool { get { return panoramas } set { panoramas = newValue }}
    var ruinsSetting: Bool { get { return ruins } set { ruins = newValue }}
}
