//
//  PostView.swift
//  SUI-HW8
//
//  Created by Dim on 07.08.2025.
//

import SwiftUI

struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct PostView: View {
    let marked: Bool
    @State private var itemHeight: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Hight")
                    .font(.custom(.base))
                    .lineLimit(1)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .background(marked ? .contrastReversed : .postHighlightBackground)
                    .foregroundStyle(marked ? .contrast : .contrastReversed)
                    .clipShape(.capsule)
                    .background(GeometryReader { geometry in
                        Color.clear.preference(key: HeightPreferenceKey.self,
                                               value: geometry.size.height)
                    })
                    .onPreferenceChange(HeightPreferenceKey.self) { value in
                        print(value)
                        self.itemHeight = value
                    }
                Spacer()
                Image(systemName: "square.and.arrow.up.circle.fill")
                    .resizable()
                    .frame(width: itemHeight, height: itemHeight)
                    .foregroundStyle(marked ? .contrastReversed : .postHighlightBackground)
                    .background(marked ? .contrast : .contrastReversed)
                    .clipShape(Circle())
            }
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting")
                .lineLimit(3)
                .font(.custom(.base, size: 20))
                .foregroundStyle(marked ? .contrast : .contrastReversed)
                .padding(.vertical)
            HStack(spacing: 2) {
                Image(systemName: "calendar.badge.clock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: itemHeight / 2 + 1, height: itemHeight / 2 + 1)
                    .foregroundStyle(marked ? .contrast : .contrastReversed)

                Text("20 march")
                    .font(.custom(.thin, size: 12))
                    .lineLimit(1)
                    .foregroundStyle(marked ? .contrast : .contrastReversed)
                Spacer()
            }
            HStack(spacing: 2) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(marked ? .contrast : .contrastReversed)
                    .frame(width: itemHeight / 2 + 1, height: itemHeight / 2 + 1)
                Spacer()
                Image(systemName: "ellipsis.message.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: itemHeight / 2 + 1, height: itemHeight / 2 + 1)
                    .foregroundStyle(marked ? .contrast : .contrastReversed)
                
                Text("4")
                    .lineLimit(1)
                    .font(.custom(.thin, size: 12))
                    .foregroundStyle(marked ? .contrast : .contrastReversed)
                Rectangle().frame(width: 7).foregroundStyle(.clear)
                Image(systemName: "paperclip")
                    .resizable()
                    .scaledToFit()
                    .frame(width: itemHeight / 2 + 1, height: itemHeight / 2 + 1)
                    .foregroundStyle(marked ? .contrast : .contrastReversed)
                
                Text("43")
                    .lineLimit(1)
                    .font(.custom(.thin, size: 12))
                    .foregroundStyle(marked ? .contrast : .contrastReversed)
                
            }
        }
        .padding()
        .background(marked ? .postMarkedBackground : .postBaseBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.vertical, 5)
        .onAppear() {
//            UIFont.familyNames.forEach { print(UIFont.fontNames(forFamilyName: $0)) }
        }
    }
}
