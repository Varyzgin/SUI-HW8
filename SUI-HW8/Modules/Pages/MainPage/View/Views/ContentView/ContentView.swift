//
//  ContentView.swift
//  SUI-HW8
//
//  Created by Dim on 07.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State var headerHeight: CGFloat = 0
    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { proxy in
                    if let font = UIFont(name: Fonts.thin.rawValue, size: 57) {
                        CustomTextAndImageView(text: "Manage your tasks", imageString: "pencil", width: proxy.size.width, heightToCount: $headerHeight, lineHeightModifier: 0.75, font: font)
                    }
                   
                }.frame(height: headerHeight)
                PostView(marked: true)
                PostView(marked: false)
                PostView(marked: true)

            }.padding(30)
        }
        .padding(.top, 30)
    }
}
