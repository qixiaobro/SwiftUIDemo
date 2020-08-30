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
        let colors = [#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)]
        
        getArray(id: "course") { (items) in
            items.forEach { (item) in

                self.courses.append(Course(
                    title: item.fields["title"] as! String,
                    subtitle: "ll",
                    image: #imageLiteral(resourceName: "Card2"),
                    logo: #imageLiteral(resourceName: "Logo1"),
                    color: colors.randomElement()!,
                    show: false))
            }
        }
    }
}


