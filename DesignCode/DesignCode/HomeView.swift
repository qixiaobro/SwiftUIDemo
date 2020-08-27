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
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile) //需要加上$
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {//showsIndicators 滚动条
                HStack(spacing: 30) { //spacing 元素间的距离
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        SectionView()
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
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Prototype designs in SwiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                Spacer()
                Image("Logo1")
            }
            
            Text("18 Sections".uppercased()) //"18 Sections"是个字符串，所以可以使用函数
                .frame(maxWidth: .infinity, alignment: .leading)//使用其最大宽度，使得文字居右
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .frame(width: 275, height: 275)
        .background(Color("card1"))
        .cornerRadius(30)
        .shadow(color: Color("card1").opacity(0.3), radius: 20, x: 0, y: 20)
    }
}
