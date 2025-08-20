//
//  SUI_HW8App.swift
//  SUI-HW8
//
//  Created by Dim on 09.07.2025.
//

import SwiftUI

enum Pages: String {
    case house, folder, plus, message, person
}

@main
struct SUI_HW8App: App {
    @State var path = Pages.house.rawValue
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .bottom) {
                TabView(selection: $path) {
                    MainPageView()
                        .tag(Pages.house.rawValue)
                    Text("Folder")
                        .tag(Pages.folder.rawValue)
                    Text("Messages")
                        .tag(Pages.message.rawValue)
                    Text("Profile")
                        .tag(Pages.person.rawValue)
                    Text("Add More")
                        .tag(Pages.plus.rawValue)
                }
                Rectangle()
                    .fill(.contrast)
                    .frame(height: 120)
                    .mask(LinearGradient(
                        gradient: Gradient(colors: [.black, .black, .black, .black, .clear, .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    ))

                    .allowsHitTesting(false)
                HStack {
                    TabItemView(path: $path, image: Pages.house.rawValue)
                    TabItemView(path: $path, image: Pages.folder.rawValue)
                    TabItemView(path: $path, image: Pages.plus.rawValue)
                    TabItemView(path: $path, image: Pages.message.rawValue)
                    TabItemView(path: $path, image: Pages.person.rawValue)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
            }
            .ignoresSafeArea()
        }
    }
}

struct TabItemView: View {
    @Binding var path: String
    var image: String
    
    var body: some View {
        Button {
            path = image
        } label: {
            if image == Pages.plus.rawValue {
                Circle()
                    .foregroundStyle(image == path ? .contrast : .contrastReversed)
                    .frame(width: 47, height: 47)
                    .overlay {
                        Image(systemName: image)
                            .resizable()
                            .foregroundStyle(image == path ? .contrastReversed : .contrast)
                            .frame(width: 17, height: 17)
                    }
            } else {
                Image(systemName: image == path ? "\(image).fill" : image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.contrastReversed)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
