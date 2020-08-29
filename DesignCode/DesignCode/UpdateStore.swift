//
//  UpdateStore.swift
//  DesignCode
//
//  Created by 朱晓东 on 2020/8/29.
//  Copyright © 2020 xiaodongzhu. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
