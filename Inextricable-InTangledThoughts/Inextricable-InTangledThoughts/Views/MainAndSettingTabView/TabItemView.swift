//
//  TabItemView.swift
//  Inextricable-InTangledThoughts
//
//  Created by 武田孝騎 on 2022/09/19.
//

import SwiftUI

struct TabItemView: View {
    
    let item: TabBarItem
    var isSelected: Bool
    
    var body: some View {
        Label {
            Text(item.title)
        } icon: {
            if isSelected {
                LinearGradient(
                    colors: [.orange, .red, .purple, .blue],
                    startPoint: .init(x: 0, y: 0),
                    endPoint: .init(x: 1.0, y: 1.0)
                )
                .mask(
                    Image(systemName: item.selectedIconName )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
            } else {
                Image(systemName: item.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .labelStyle(.verticalStyle)
        .foregroundColor(isSelected ? .white : .gray)
        .padding(.vertical,8)
        .frame(maxWidth: .infinity)
    }
}

struct CTabItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView(item: .main, isSelected: true)
            .previewLayout(.fixed(width: 50, height: 50))
            
    }
}

struct VerticalStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            configuration.icon
                .frame(height: 27)
            configuration.title
                .font(.footnote)
        }
    }
}

extension LabelStyle where Self == VerticalStyle {
    static var verticalStyle: VerticalStyle {
        .init()
    }
}
