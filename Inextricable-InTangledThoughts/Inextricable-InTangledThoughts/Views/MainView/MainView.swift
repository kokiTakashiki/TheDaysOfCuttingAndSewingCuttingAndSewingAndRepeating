//
//  MainView.swift
//  Inextricable-InTangledThoughts
//
//  Created by 武田孝騎 on 2022/09/20.
//

import SwiftUI
import SceneKit

struct MainView: View {
    
    @State private var povName = "distantCamera"
    private var testScene = SCNScene(named: "art.scnassets/test.scn")!
    
    var body: some View {
        SceneView(
            scene: testScene
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
