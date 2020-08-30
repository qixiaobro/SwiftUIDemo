//
//  DataStore.swift
//  DesignCode
//
//  Created by 朱晓东 on 2020/8/30.
//  Copyright © 2020 xiaodongzhu. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
