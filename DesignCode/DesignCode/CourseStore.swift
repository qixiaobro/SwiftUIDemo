//
//  CourseStore.swift
//  DesignCode
//
//  Created by 朱晓东 on 2020/8/30.
//  Copyright © 2020 xiaodongzhu. All rights reserved.
//

import SwiftUI
import Contentful

let client = Client(spaceId: "4vvw477fg2cd", accessToken: "0EGD6PHDc-06-kwmV8d2UWCCB9xo7lo1_sFYuxJcTas")

func getArray() {
    let query = Query.where(contentTypeId: "course")
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        print(result)
    }
}
