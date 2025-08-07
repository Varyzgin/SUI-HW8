//
//  FontsStyle.swift
//  SUI-HW8
//
//  Created by Dim on 07.08.2025.
//

import SwiftUI

enum Fonts: String {
    case base = "Inter-Regular"
    case thin = "Nunito-Medium"
}
extension Font {
    static func custom(_ name: Fonts, size: CGFloat = 13) -> Font {
        .custom(name.rawValue, size: size)
    }
}
