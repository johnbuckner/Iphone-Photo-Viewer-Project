//
//  ImageURLs.swift
//  Viewer
//
//  Created by Jim Harper on 4/30/17.
//  Copyright © 2017 Jim Harper. All rights reserved.
//

import Foundation

struct ImageURLs
{
    let canyons: [String] = [
        "image-201.jpg",
        "image-202.jpg",
        "image-203.jpg",
        "image-204.jpg",
        "image-205.jpg",
        "image-206.jpg",
        "image-207.jpg",
        "image-208.jpg",
        "image-209.jpg",
        "image-210.jpg",
        "image-211.jpg",
        "image-212.jpg",
        "image-213.jpg",
        "image-214.jpg",
        "image-215.jpg",
        "image-216.jpg",
        "image-217.jpg",
        "image-218.jpg",
        "image-219.jpg",
        "image-220.jpg",
        "image-221.jpg",
        "image-222.jpg",
        "image-223.jpg",
        "image-224.jpg",
        "image-225.jpg",
        "image-226.jpg",
        "image-227.jpg",
        "image-228.jpg",
        "image-229.jpg",
        "image-230.jpg"
    ]
    
    let fauna: [String] = [
        "image-001.jpg",
        "image-002.jpg",
        "image-003.jpg",
        "image-004.jpg",
        "image-005.jpg",
        "image-006.jpg",
        "image-007.jpg",
        "image-008.jpg",
        "image-009.jpg",
        "image-010.jpg",
        "image-011.jpg",
        "image-012.jpg",
        "image-013.jpg",
        "image-014.jpg",
        "image-015.jpg"        ]
    
    let flora: [String] = [
        "image-101.jpg",
        "image-102.jpg",
        "image-103.jpg",
        "image-104.jpg",
        "image-105.jpg",
        "image-106.jpg",
        "image-107.jpg",
        "image-108.jpg",
        "image-109.jpg",
        "image-110.jpg",
        "image-111.jpg",
        "image-112.jpg",
        "image-113.jpg",
        "image-114.jpg",
        "image-115.jpg",
        "image-116.jpg",
        "image-117.jpg",
        "image-118.jpg",
        "image-119.jpg",
        "image-120.jpg",
        "image-121.jpg",
        "image-122.jpg",
        "image-123.jpg",
        "image-124.jpg",
        "image-125.jpg",
        "image-126.jpg",
        "image-127.jpg",
        "image-128.jpg"
    ]
    
    let mountains: [String] = [
        "image-501.jpg",
        "image-502.jpg",
        "image-503.jpg",
        "image-504.jpg",
        "image-505.jpg",
        "image-506.jpg",
        "image-507.jpg",
        "image-508.jpg",
        "image-509.jpg",
        "image-510.jpg",
        "image-511.jpg",
        "image-512.jpg",
        "image-513.jpg",
        "image-514.jpg",
        "image-515.jpg",
        "image-516.jpg",
        "image-517.jpg",
        "image-518.jpg",
        "image-519.jpg",
        "image-520.jpg",
        "image-521.jpg",
        "image-522.jpg",
        "image-523.jpg",
        "image-524.jpg",
        "image-525.jpg",
        "image-526.jpg",
        "image-527.jpg",
        "image-528.jpg",
        "image-529.jpg"
    ]
    
    
    let panoramas: [String] = [
        "image-301.jpg",
        "image-302.jpg",
        "image-303.jpg",
        "image-304.jpg",
        "image-305.jpg",
        "image-306.jpg",
        "image-307.jpg",
        "image-308.jpg",
        "image-309.jpg",
        "image-310.jpg",
        "image-311.jpg",
        "image-312.jpg",
        "image-313.jpg",
        "image-314.jpg",
        "image-315.jpg",
        "image-316.jpg",
        "image-317.jpg",
        "image-318.jpg",
        "image-319.jpg",
        "image-320.jpg",
        "image-321.jpg",
        "image-322.jpg",
        "image-323.jpg",
        "image-324.jpg",
        "image-325.jpg",
        "image-326.jpg",
        "image-327.jpg",
        "image-328.jpg",
        "image-329.jpg",
        "image-330.jpg"
    ]

    let ruins: [String] = [
        "image-401.jpg",
        "image-402.jpg",
        "image-403.jpg",
        "image-404.jpg",
        "image-405.jpg",
        "image-406.jpg",
        "image-407.jpg",
        "image-408.jpg",
        "image-409.jpg",
        "image-410.jpg",
        "image-411.jpg",
        "image-412.jpg",
        "image-413.jpg",
        "image-414.jpg",
        "image-415.jpg",
        "image-416.jpg",
        "image-417.jpg"
    ]

    func mySet(photoSettings: Settings) -> [String] {
        
        var selectedPhotos: [String]? = []
        
        if photoSettings.canyonsSetting {
            selectedPhotos = selectedPhotos! + canyons
        }
        if photoSettings.faunaSetting {
            selectedPhotos = selectedPhotos! + fauna
        }
        if photoSettings.floraSetting {
            selectedPhotos = selectedPhotos! + flora
        }
        if photoSettings.mountainsSetting {
            selectedPhotos = selectedPhotos! + mountains
        }
        if photoSettings.panoramasSetting {
            selectedPhotos = selectedPhotos! + panoramas
        }
        if photoSettings.ruinsSetting {
            selectedPhotos = selectedPhotos! + ruins
        }
        
        return selectedPhotos!
    }
}
