//
//  HomeView.swift
//  DesignCode
//
//  Created by 朱晓东 on 2020/8/27.
//  Copyright © 2020 xiaodongzhu. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile) //需要加上$
                
                Button(action: { self.showUpdate.toggle() }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {//showsIndicators 滚动条
                HStack(spacing: 20) { //spacing 元素间的距离
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: //从geometry获得的最小值是30 也就是边距
                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0, y: 10.0, z: 0))
                            
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased()) //"18 Sections"是个字符串，所以可以使用函数
                .frame(maxWidth: .infinity, alignment: .leading)//使用其最大宽度，使得文字居右
            section.Image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {//唯一性
    var id = UUID() //自动生成唯一id
    var title: String
    var text: String
    var logo: String
    var Image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", Image: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color("card1")),
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", Image: Image("Card2"), color: Color("card2")),
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", Image: Image("Card3"), color: Color("card3")),
]

