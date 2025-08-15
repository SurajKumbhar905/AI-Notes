//
//  FolderShape.swift
//  AI-Notes
//
//  Created by Suraj-KU on 05/08/25.
//

import SwiftUI

struct FolderShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width + 30
        let h = rect.height + 30
        
        path.move(to: CGPoint(x: 0.07207*w, y: 0.21162*h))
        path.addCurve(
            to: CGPoint(x: 0.16216*w, y: 0.12863*h),
            control1: CGPoint(x: 0.07207*w, y: 0.16579*h),
            control2: CGPoint(x: 0.11241*w, y: 0.12863*h)
        )
        path.addLine(to: CGPoint(x: 0.46698*w, y: 0.12863*h))
        path.addCurve(
            to: CGPoint(x: 0.54045*w, y: 0.16359*h),
            control1: CGPoint(x: 0.49617*w, y: 0.12863*h),
            control2: CGPoint(x: 0.52355*w, y: 0.14166*h)
        )
        path.addLine(to: CGPoint(x: 0.58568*w, y: 0.22230*h))
        path.addCurve(
            to: CGPoint(x: 0.65915*w, y: 0.25726*h),
            control1: CGPoint(x: 0.60258*w, y: 0.24423*h),
            control2: CGPoint(x: 0.62995*w, y: 0.25726*h)
        )
        path.addLine(to: CGPoint(x: 0.75225*w, y: 0.25726*h))
        path.addCurve(
            to: CGPoint(x: 0.84234*w, y: 0.34025*h),
            control1: CGPoint(x: 0.80201*w, y: 0.25726*h),
            control2: CGPoint(x: 0.84234*w, y: 0.29442*h)
        )
        path.addLine(to: CGPoint(x: 0.84234*w, y: 0.75519*h))
        path.addCurve(
            to: CGPoint(x: 0.75225*w, y: 0.83817*h),
            control1: CGPoint(x: 0.84234*w, y: 0.80102*h),
            control2: CGPoint(x: 0.80201*w, y: 0.83817*h)
        )
        path.addLine(to: CGPoint(x: 0.16216*w, y: 0.83817*h))
        path.addCurve(
            to: CGPoint(x: 0.07207*w, y: 0.75519*h),
            control1: CGPoint(x: 0.11241*w, y: 0.83817*h),
            control2: CGPoint(x: 0.07207*w, y: 0.80102*h)
        )
        path.addLine(to: CGPoint(x: 0.07207*w, y: 0.21162*h))
        path.closeSubpath()
        return path
    }
}

