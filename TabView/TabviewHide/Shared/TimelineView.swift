//
//  TimelineView.swift
//  hyexplorer
//
//  Created by kai jin on 2020/8/18.
//

import SwiftUI

struct TimelineView: View {
    var body: some View {
        NavigationLink(destination: Text("NewPage")) {
            Text("NewPage")
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
