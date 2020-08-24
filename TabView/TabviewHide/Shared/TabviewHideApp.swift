//
//  TabviewHideApp.swift
//  Shared
//
//  Created by kai jin on 2020/8/24.
//

import SwiftUI

@main
struct TabviewHideApp: App {
    #if targetEnvironment(macCatalyst)
    var body: some Scene {
        WindowGroup {
            SplitView()
        }
    }
    #else
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
    #endif
}
