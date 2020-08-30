//
//  TabBar.swift
//  DesignCode
//
//  Created by 朱晓东 on 2020/8/29.
//  Copyright © 2020 xiaodongzhu. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            CourseList().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }
//        .edgesIgnoringSafeArea(.)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 8")
            TabBar().previewDevice("iPhone 11 Pro Max")
        }
    }
}
