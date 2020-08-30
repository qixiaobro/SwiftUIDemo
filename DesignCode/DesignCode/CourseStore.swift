//
//  CourseStore.swift
//  DesignCode
//
//  Created by 朱晓东 on 2020/8/30.
//  Copyright © 2020 xiaodongzhu. All rights reserved.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "4vvw477fg2cd", accessToken: "0EGD6PHDc-06-kwmV8d2UWCCB9xo7lo1_sFYuxJcTas")

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
               completion(array.items)
            }
        case .failure(let error):
            print(error)
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    init() {
        getArray(id: "course") { (items) in
            items.forEach { (item) in

                self.courses.append(Course(
                    title: item.fields["title"] as! String,
                    subtitle: "ll",
                    image: #imageLiteral(resourceName: "Card2"),
                    logo: #imageLiteral(resourceName: "Logo1"),
                    color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),
                    show: false))
            }
        }
    }
}


