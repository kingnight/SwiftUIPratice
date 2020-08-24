//
//  MainEntranceView.swift
//  hyexplorer
//
//  Created by kai jin on 2020/8/18.
//

import SwiftUI

struct TabBarView: View {
    init() {
//        UITabBar.appearance().barTintColor = UIColor.white
    }
    enum Tab:Int,Equatable {
        case timeline = 0
        case discover
        case my
        
        public static func == (lhs:Tab,rhs:Tab) ->Bool {
            if lhs.rawValue == rhs.rawValue {
                return true
            }
            else{
                return false
            }
        }
    }
    
    @State var selectedTab = Tab.timeline
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                TimelineView()
                    .tabItem {
                        TabItem(text: "动态", image: "square", isSelected: selectedTab == .timeline)
                    }
                    .tag(Tab.timeline)
                
                DiscoverView()
                    .tabItem {
                        TabItem(text: "发现", image: "triangle", isSelected: selectedTab == .discover)
                    }
                    .tag(Tab.discover)
                
                MyView()
                    .tabItem {
                        TabItem(text: "我", image: "circle", isSelected: selectedTab == .my)
                    }
                    .tag(Tab.my)
            }
//            .accentColor(.yellow)
        }
    }
}

struct TabItem:View {
    let text:String
    let image:String
    let isSelected:Bool
    
    var body: some View {
        VStack{
            Image(systemName:isSelected ? "\(image).fill" : image)
//                .imageScale(.large)
            Text(text)
        }.animation(.easeInOut)
    }
}

struct MainEntranceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView()
            TabBarView()
                .preferredColorScheme(.dark)
        }
    }
}
