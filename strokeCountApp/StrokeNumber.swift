//
//  StrokeNumber.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/18.
//  Copyright © 2020 nararyo. All rights reserved.
//

import Foundation

class StrokeNumber {
    
    var number: Int
    var luckLebel: String
    var describe: String
    
    init(strokeNumberSourceArray: [String]){
        number = Int(strokeNumberSourceArray[0]) ?? 1
        luckLebel = strokeNumberSourceArray[1]
        describe = strokeNumberSourceArray[2]
    }
    
    var rate: Int {
        get {
            switch luckLebel {
            case "際大吉":
                return 7
            case "特大吉":
                return 6
            case "大吉":
                return 5
            case "吉":
                return 4
            case "中吉":
                return 3
            case "凶":
                return 2
            case "大凶":
                return 1
            case "特大凶":
                return 0
            default:
                return 3
            }
        }
    }
    
    
    
}
