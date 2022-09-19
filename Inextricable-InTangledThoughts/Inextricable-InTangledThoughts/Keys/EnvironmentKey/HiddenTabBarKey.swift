//
//  HiddenTabBarKey.swift
//  Inextricable-InTangledThoughts
//
//  Created by 武田孝騎 on 2022/09/19.
//

import SwiftUI

struct HiddenTabBarKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isHiddenTabBar: Bool {
        get { self[HiddenTabBarKey.self] }
        set { self[HiddenTabBarKey.self] = newValue }
    }
}
