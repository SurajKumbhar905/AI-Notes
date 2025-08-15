//
//  ColorConstent.swift
//  AI-Notes
//
//  Created by Suraj-KU on 04/08/25.
//

import Foundation
import UIKit
import SwiftUI


extension Color{
    static let primaryBackGround : Color = Color(hex: "#F9F8FD", alpha: 1.0)
    static let secondryBackGround : Color = Color(hex: "#6B4EFF", alpha: 1.0)
    static let turnaryryBackGround : Color = Color(hex: "#B3A4FF", alpha: 1.0)
    
    static let primaryText :  Color = Color(hex: "#292150", alpha: 1.0)
    static let secondaryText :  Color = Color(hex: "#B6B0D9", alpha: 1.0)
    
    static let tintColor : Color = Color(hex: "#6B4EFF", alpha: 1.0)
}

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
           case red, green, blue, alpha
       }
    
    public init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           let red = try container.decode(Double.self, forKey: .red)
           let green = try container.decode(Double.self, forKey: .green)
           let blue = try container.decode(Double.self, forKey: .blue)
           let alpha = try container.decode(Double.self, forKey: .alpha)
           self.init(red: red, green: green, blue: blue, opacity: alpha)
       }
    
    public func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           let uiColor = UIColor(self) // Convert to UIColor to get components
           try container.encode(uiColor.redComponent, forKey: .red)
           try container.encode(uiColor.greenComponent, forKey: .green)
           try container.encode(uiColor.blueComponent, forKey: .blue)
           try container.encode(uiColor.alphaComponent, forKey: .alpha)
       }
    
}

extension UIColor {
    var redComponent: CGFloat { return CIColor(color: self).red }
    var greenComponent: CGFloat { return CIColor(color: self).green }
    var blueComponent: CGFloat { return CIColor(color: self).blue }
    var alphaComponent: CGFloat { return CIColor(color: self).alpha }
}
