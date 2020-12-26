//
//  AlphabetName.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/16.
//  Copyright © 2020 nararyo. All rights reserved.
//

import Foundation
import RealmSwift

class StrokeFortuneResult: Object{
    
    @objc dynamic var stroke: Stroke?
    @objc dynamic var rate: Double = 0
    @objc dynamic var describe: String = ""
    @objc dynamic var userComment: String = ""
    
    convenience init(stroke: Stroke, strokeFortuneData: StrokeFortuneData) {
        self.init()
        self.stroke = stroke
        self.rate = strokeFortuneData.rate
        self.describe = strokeFortuneData.describe
    }
}




