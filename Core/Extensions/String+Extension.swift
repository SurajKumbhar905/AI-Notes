//
//  String+Extension.swift
//  AI-Notes
//
//  Created by Suraj-KU on 10/08/25.
//

import Foundation
import SwiftUI

extension String {
    func heightFor(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [.font: font],
            context: nil
        )
        return ceil(boundingBox.height)
    }
}
