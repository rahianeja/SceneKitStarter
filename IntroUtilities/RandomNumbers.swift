//
//  RandomNumbers.swift
//  sceneKitIntro
//

import Foundation
import UIKit
import SceneKit


public extension Double {
    public static func random(min: Double, max: Double) -> Double {
        let r1 = Double(arc4random(UInt64.self)) / Double(UInt64.max)
        return (r1 * (max - min)) + min
    }
}

public extension Float {
    public static func random(min: Float, max: Float) -> Float {
        let r2 = Float(arc4random(UInt32.self)) / Float(UInt32.max)
        return (r2 * (max - min)) + min
    }
}

public func arc4random <T: ExpressibleByIntegerLiteral> (_ type: T.Type) -> T {
    var r: T = 0
    arc4random_buf(&r, Int(MemoryLayout<T>.size))
    return r
}

public extension Int {
    public static func random(min: Int , max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
}


let UIColorOptions:[UIColor] = [
    UIColor.black, // pure black
    UIColor.silver,
    UIColor.gray, // dim gray
    UIColor.darkGray,
    UIColor.brown, // peru brown
    UIColor.blue, // dodgerblue
    UIColor.cyan, // dark cyan
    UIColor.white, // whitesmoke
    UIColor.red, // crimson
    UIColor.maroon,
    UIColor.yellow, // light yellow
    UIColor.green, // lawn green
    UIColor.lime, // lime green
    UIColor.olive, // dark olive green
    UIColor.magenta,
    UIColor.orange, // dark orange
    UIColor.purple, // more of a dark magenta
    UIColor.teal, // closer to dark cyan
]

extension UIColor {
    
    public static func random() -> UIColor {
        let maxValue = UIColorOptions.count
        let rand = Int(arc4random_uniform(UInt32(maxValue)))
        return UIColorOptions[rand]
    }
    
    public static var black: UIColor {
        return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    
    public static var silver: UIColor {
        return UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0)
    }
    
    public static var gray: UIColor {
        return UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1.0)
    }
    
    public static var darkGray: UIColor {
        return UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1.0)
    }
    
    public static var brown: UIColor {
        return UIColor(red: 205/255, green: 133/255, blue: 63/255, alpha: 1.0)
    }
    
    public static var blue: UIColor {
        return UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1.0)
    }
    
    public static var cyan: UIColor {
        return UIColor(red: 0.0, green: 139/255, blue: 139/255, alpha: 1.0)
    }
    
    public static var white: UIColor {
        return UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
    }
    
    public static var red: UIColor {
        return UIColor(red: 220/255, green: 20/225, blue: 60/255, alpha: 1.0)
    }
    
    public static var maroon: UIColor {
        return UIColor(red: 128/255, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    
    public static var yellow: UIColor {
        return UIColor(red: 255/255, green: 255/255, blue: 102/255, alpha: 1.0)
    }
    
    public static var green: UIColor {
        return UIColor(red: 124/255, green: 252/255, blue: 0.0, alpha: 1.0)
    }
    
    public static var lime: UIColor {
        return UIColor(red: 50/255, green: 205/255, blue: 50/255, alpha: 1.0)
    }
    
    public static var olive: UIColor {
        return UIColor(red: 85/255, green: 107/255, blue: 47/255, alpha: 1.0)
    }
    
    public static var magenta: UIColor {
        return UIColor(red: 255/255, green: 0.0, blue: 255/255, alpha: 1.0)
    }
    
    public static var orange: UIColor {
        return UIColor(red: 255/255, green: 140/255, blue: 0.0, alpha: 1.0)
    }
    
    public static var purple: UIColor {
        return UIColor(red: 139/255, green: 0.0, blue: 139/255, alpha: 1.0)
    }
    
    public static var teal: UIColor {
        return UIColor(red: 0.0, green: 139/255, blue: 139/255, alpha: 1.0)
    }

}






// NOTES

// Colors
   // Great color code ideas at www.rapidtables.com

// Random number references
   // https://gist.github.com/zmeyc/762b33b8428e8a0fface
