//
//  Shapes.swift
//  SceneKitInto
//
//  Created by rohit aneja on 18/03/18.
//  Copyright © 2018 rohi aneja. All rights reserved.
//

import Foundation

enum ShapeType:Int {
    case cone
    case capsule
    case tube
    case sphere
    case torus
    case pyramid
    case cylinder
    case box
    
    static func random() -> ShapeType {
        let maxvalue = tube.rawValue
        let rand = arc4random_uniform(UInt32(maxvalue+1))
        return ShapeType(rawValue: Int(rand))!
    }
}
