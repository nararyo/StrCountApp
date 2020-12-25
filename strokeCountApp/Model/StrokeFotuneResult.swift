//
//  AlphabetName.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/16.
//  Copyright © 2020 nararyo. All rights reserved.
//

import Foundation

class StrokeFortuneResult{
    
    var stroke: Stroke
    var rate: Double
    var describe: String
    var userComment: String?
    
    init(stroke: Stroke, strokeFortuneData: StrokeFortuneData) {
        self.stroke = stroke
        self.rate = strokeFortuneData.rate
        self.describe = strokeFortuneData.describe
    }
}




