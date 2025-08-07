//
//  NavigationBarView.swift
//  SUI-HW8
//
//  Created by Dim on 07.08.2025.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.contrast)
                .frame(height: 150)
                .mask(LinearGradient(
                    gradient: Gradient(colors: [.black, .black, .black, .black, .clear, .clear]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .ignoresSafeArea()
                .allowsHitTesting(false)
            
            
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.contrastReversed)
                }
                Spacer()
                Button {
                    //
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.contrastReversed)
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

struct ImageSquareModifier: ViewModifier {
    func body(content: Content) -> some View {
        //        GeometryReader { geometry in
        content
            .frame(width: 50, height: 50)
        //                .clipShape(Circle())
        //        }
    }
}
