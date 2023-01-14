//
//  ContentView.swift
//  Inextricable-InTangledThoughts
//
//  Created by 武田孝騎 on 2022/09/18.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
        var body: some View {
            ZStack {
                LinearGradient(
                    colors: [.orange, .red, .red, .purple],
                    startPoint: .init(x: 0, y: 0),
                    endPoint: .init(x: 1.0, y: 1.0)
                )
                .ignoresSafeArea(edges: [.top, .bottom])
                
                Button("Sheetを開く") {
                    self.showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    MainAndSettingTabView()
                        .clearModalBackground()
                }
            }
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
