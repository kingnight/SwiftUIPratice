//
//  ContentView.swift
//  OSLog
//
//  Created by kai jin on 2020/8/11.
//

import SwiftUI
import os


struct Model {
    let taskId:String
    let giftCardId:String
    let serverId:Int
    let seconds:Double
}

struct ContentView: View {
    let message = "test string"
    let cash = 100
    
    let modelArray:[Model] = [
        Model(taskId: "9B82D4CF-6A8A-486C-BFE3", giftCardId: "CP33B3D", serverId: 2, seconds: 1.66),
        Model(taskId: "9B86yiuU-6A8A-679G-BFE3", giftCardId: "CB4A", serverId: 1, seconds: 1.546),
        Model(taskId: "9B86yiuU-6A8A-679G-BF43", giftCardId: "CB4AYYYYYYY", serverId: 3, seconds: 1.44)
        
    ]
    
    var body: some View {
        VStack{
            Button(action: {
                Logger.makeLogger().log("\(message)")
            }) {
                Text("通用显示文件名函数行数log")
            }.padding()
            
            Button(action: {
                Logger.statics.log("\(message)")
            }) {
                Text("单独自定义category")
            }.padding()

            Button(action: {
                Logger.statics.debug("\(message)")
            }) {
                Text("debug")
            }.padding()
            
            Button(action: {
                Logger.statics.debug("I have \(cash,privacy:.private) RMB")
            }) {
                Text("数字信息，默认private xCode可见，console不可见")
            }.padding()
            
            
            Button(action: {
                for m in modelArray {
                    Logger.statics.debug("\(m.taskId) \(m.giftCardId) \(m.serverId) \(m.seconds)")
                }
                
            }) {
                Text("格式化前")
            }.padding()
            
            
            Button(action: {
                for m in modelArray {
                    Logger.statics.debug("\(m.taskId) \(m.giftCardId,align:.left(columns:24)) \(m.serverId) \(m.seconds,format:.fixed(precision:2))")
                }
                
            }) {
                Text("格式化后")
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
