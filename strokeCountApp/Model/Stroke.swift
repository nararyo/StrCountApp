//
//  StrokeCounter.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/24.
//  Copyright © 2020 nararyo. All rights reserved.
//

import Foundation
import RealmSwift

class Stroke: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var isLowerCaseRecognized: Bool = true
    
    var aStroke = [String]()
    var twoStrokes = [String]()
    var threeStrokes = [String]()
    var fourStrokes = [String]()
    
    convenience init(name: String, isLowerCaseRecognized: Bool){
        
        self.init()
        self.name = name
        self.isLowerCaseRecognized = isLowerCaseRecognized
        
        switch isLowerCaseRecognized {
            case true:
                self.aStroke = ["c", "l", "o", "s", "C", "I", "J", "O", "S", "U", "-", "_", "."]
                self.twoStrokes = ["a","b", "d", "e", "f", "g", "h", "i", "j", "n", "p", "q", "r", "t", "u", "v", "x", "y", "D", "G", "L", "P", "Q", "V", "X", "2", "3", "4", "6", "7", "8", "9"]
                self.threeStrokes = ["k", "m", "z", "A", "B", "F", "H", "K", "N", "R", "Y", "Z", "5"]
                self.fourStrokes = ["w", "E",  "M", "W"]

            case false:
                self.aStroke = ["c", "C", "i", "I", "j", "J", "o", "O", "s", "S", "1", "0", "-", "_", "."]
                self.twoStrokes = ["d", "D", "p", "P","g", "G", "l", "L", "q", "Q", "t", "T", "v", "V", "u", "U", "x", "X", "z", "Z", "2", "3", "4", "6", "7", "8", "9"]
                self.threeStrokes = ["a", "A","b", "B", "f", "F", "h", "H", "k", "K", "n", "N", "r", "R", "y", "Y", "5"]
                self.fourStrokes = ["e", "E", "m", "M", "w", "W"]
        }
    }
    
    public var count: Int? {
        get {
            var count = 0
            for i in name {
                if aStroke.contains(String(i)){
                    count += 1
                }else if twoStrokes.contains(String(i)){
                    count += 2
                }else if threeStrokes.contains(String(i)){
                    count += 3
                }else {
                    count += 4
                }
            }
            return count
        }
    }
}

