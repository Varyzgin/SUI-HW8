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
    @State private var itemHeight: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Hight")
                    .font(.custom(.base))
                    .lineLimit(1)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .background(.contrastReversed)
                    .foregroundStyle(.contrast)
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
                    .foregroundStyle(.contrastReversed)
                    .background(.contrast)
                    .clipShape(Circle())
            }
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting")
                .lineLimit(3)
                .font(.custom(.base, size: 20))
                .foregroundStyle(.contrast)
            
            
                .padding(.vertical)
            HStack {
                Image(systemName: "calendar.badge.clock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: itemHeight, height: itemHeight)
                    .foregroundStyle(.postBaseBackground)
                
                //                    .resizable()
                //                    .frame(width: itemHeight, height: itemHeight)
                
                Text("20 march")
                    .font(.custom(.thin, size: 12))
                    .lineLimit(1)
                    .foregroundStyle(.postBaseBackground)
                Spacer()
            }
            //            .background()
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.postBaseBackground)
                    .frame(width: itemHeight, height: itemHeight)
                Spacer()
                Image(systemName: "ellipsis.message.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: itemHeight, height: itemHeight)
                    .foregroundStyle(.postBaseBackground)
                
                Text("4")
                    .lineLimit(1)
                    .font(.custom(.thin, size: 12))
                    .foregroundStyle(.postBaseBackground)
                
                Image(systemName: "paperclip")
                    .resizable()
                    .scaledToFit()
                    .frame(width: itemHeight, height: itemHeight)
                    .foregroundStyle(.postBaseBackground)
                
                Text("43")
                    .lineLimit(1)
                    .font(.custom(.thin, size: 12))
                    .foregroundStyle(.postBaseBackground)
                
            }
        }
        .padding()
        .background(Color(UIColor(red: 0.71, green: 0.81, blue: 0.97, alpha: 1.0)))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onAppear() {
//            UIFont.familyNames.forEach { print(UIFont.fontNames(forFamilyName: $0)) }
        }
    }
}
