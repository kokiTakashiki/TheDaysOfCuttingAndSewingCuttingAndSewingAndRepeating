//
//  TabBarItem.swift
//  Inextricable-InTangledThoughts
//
//  Created by 武田孝騎 on 2022/09/19.
//

import SwiftUI

enum TabBarItem: Int, CaseIterable, Identifiable {
    
    var id: String { UUID().uuidString }
    
    case main, setting
    
    var iconName:String {
        switch self {
        case .main: return "list.bullet.rectangle.portrait"
        case .setting: return "gearshape"
        }
    }
    
    var selectedIconName: String {
        switch self {
        case .main: return "list.bullet.rectangle.portrait.fill"
        case .setting: return "gearshape.fill"
        }
    }
    
    var title:String {
        switch self {
        case .main: return "stages"
        case .setting: return "settings"
        }
    }
    
}
