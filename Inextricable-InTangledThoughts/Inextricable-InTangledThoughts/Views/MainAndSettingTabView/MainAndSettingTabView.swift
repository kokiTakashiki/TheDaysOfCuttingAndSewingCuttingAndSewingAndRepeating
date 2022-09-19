//
//  MainAndSettingTabView.swift
//  Inextricable-InTangledThoughts
//
//  Created by 武田孝騎 on 2022/09/19.
//

import SwiftUI

struct MainAndSettingTabView: View {
    @State var selectionItem: TabBarItem = .main
    @State var isHiddenTabBar: Bool = false
    var body: some View {
        ZStack {
            HideableTabBarView
                .hiddenTabBar(is: isHiddenTabBar)
        }
    }
    
    // Screens
    @ViewBuilder
    private func switchScreens() -> some View {
        switch selectionItem {
        case .main:
            Color.gray
        case .setting:
            Color.blue
        }
    }
}

//
// HideableTabBarView
//
extension MainAndSettingTabView {
    
    private var HideableTabBarView: some View {
        Inextricable_InTangledThoughts
            .HideableTabBarView(
                TabBarItem.allCases,
                selectedIndex: selectedIndex,
                content: {
                    switchScreens()
                        .transition(.identity)
                        .cornerRadius(30)
                },
                tabItem: { item, isSelected  in
                    TabItemView(item: item, isSelected: isSelected)
                })
    }
    
    private var selectedIndex: Binding<Int> {
        Binding(
            get: {
                selectionItem.rawValue
            },
            set: {
                selectionItem = TabBarItem(rawValue: $0) ?? .main
            }
        )
    }
}

fileprivate extension View {
    func hiddenTabBar(is: Bool) -> some View {
        environment(\.isHiddenTabBar, `is`)
    }
}

struct MainAndSettingTabView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.light, ColorScheme.dark], id: \.self) { colorScheme in
            ForEach(["iPhone 12", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
                ForEach(["en_US", "ja_JP"], id: \.self) { id in
                    MainAndSettingTabView()
                        .environment(\.locale, .init(identifier: id))
                        .preferredColorScheme(colorScheme)
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
                }
            }
        }
    }
}
