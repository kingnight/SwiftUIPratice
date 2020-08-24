//
//  ContentView.swift
//  Shared
//
//  Created by kai jin on 2020/8/24.
//

import SwiftUI

struct ContentView: View {
    enum Tab:Int,Equatable,CaseIterable {
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
        
        public func stringValue() -> String {
            switch self {
            case .timeline:
                return "timeline"
            case .discover:
                return "discover"
            case .my:
                return "my"
            }
        }
    }
    
    @State var selectedTab = Tab.timeline
    
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom))
            {
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
                .tabViewStyle(PageTabViewStyle(indexDisplayMode:.never))
                
                HStack{
                    ForEach(Tab.allCases,id:\.self) { (tab) in
                        Group{
                            if tab == Tab.timeline  {
                                TabButton(image: "square", tabRawValue: tab.rawValue, selectedTab: $selectedTab)
                            }
                            else if tab == Tab.discover {
                                TabButton(image: "triangle", tabRawValue: tab.rawValue, selectedTab: $selectedTab)
                            }
                            else {
                                TabButton(image: "circle", tabRawValue: tab.rawValue, selectedTab: $selectedTab)
                            }

                            if tab != Tab.allCases.last {
                                Spacer(minLength: 0)
                            }
                        }
                    }
                }
                .padding(.horizontal,25)
                .padding(.vertical,5)
                .background(Color.black)
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
                .padding(.horizontal)
                // for smaller iphones....
                // elevations...
//                .padding(.bottom,edge!.bottom == 0 ? 20 : 0)
            }
            
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
            Text(text)
        }.animation(.easeInOut)
    }
}

struct TabButton:View {
    let image:String
    let tabRawValue:Int
    @Binding var selectedTab : ContentView.Tab
    
    var body: some View{
        Button(action: {
            selectedTab  = ContentView.Tab(rawValue: tabRawValue) ?? ContentView.Tab.timeline
        }) {
            Image(systemName:selectedTab.rawValue == tabRawValue ? "\(image).fill" : image)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
