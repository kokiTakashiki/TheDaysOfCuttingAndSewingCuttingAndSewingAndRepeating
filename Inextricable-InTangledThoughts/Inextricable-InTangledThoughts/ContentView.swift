//
//  ContentView.swift
//  Inextricable-InTangledThoughts
//
//  Created by 武田孝騎 on 2022/09/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.light, ColorScheme.dark], id: \.self) { colorScheme in
            ForEach(["iPhone 12", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
                ForEach(["en_US", "ja_JP"], id: \.self) { id in
                    ContentView()
                        .environment(\.locale, .init(identifier: id))
                        .preferredColorScheme(colorScheme)
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
                }
            }
        }
    }
}
