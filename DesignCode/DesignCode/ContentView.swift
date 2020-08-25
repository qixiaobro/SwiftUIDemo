//
//  ContentView.swift
//  DesignCode
//
//  Created by 朱晓东 on 2020/8/25.
//  Copyright © 2020 xiaodongzhu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
            }
            .frame(width:300, height: 220)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(x:0, y:-20)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("UI Design")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Certificate")
                            .foregroundColor(Color("accent"))
                    }
                    Spacer()
                    Image("Logo1")
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                Spacer()
                Image("Card1")
                .resizable()//调节图像的大小
                .aspectRatio(contentMode: .fill)//调节图像的自适应大小，适应框的大小
                    .frame(width: 300.0, height: 110.0,alignment: .top)
            }
            .frame(width: 340.0, height: 220.0)//设置VSack的宽高
            .background(Color.black)
            .cornerRadius(20)
                .shadow(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
