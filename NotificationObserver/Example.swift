////
////  ListenerTest.swift
////  NotificationObserver
////
////  Created by happts on 2020/11/17.
////  Copyright © 2020 happts. All rights reserved.
////
//
//import Foundation
//
//// 1. define your XXXObserver's notificationName
//private var downloadServiceName:Notification.Name { .init(rawValue: "DownloadServiceObserver")}
//
//// 2.1 define your XXXObserver
//public protocol DownloadServiceListener:NotificationObserver {
//    func progressUpdated(model:String,progress:Float)
//    func statusUpdated(models:[String])
//}
///// 3. XXXObserverParam
///// use enum as exmple, each case is NotificationObserver's function
//public enum DownloadServiceListenerParam:NotificationParam{
//    case progressUpdated(model:String,progress:Float)
//    case statusUpdated(models:[String])
//    
//    public var name:Notification.Name {
//        downloadServiceName
//    }
//}
//
//// 4 XXXObserver extension
//extension DownloadServiceListener{
//    static public var name: Notification.Name{ downloadServiceName }
//    public func receive(notification: Notification) {
//        guard notification.name == Self.name ,
//              let param:DownloadServiceListenerParam = notification.getParamInfo() else {
//            fatalError("param is nil or Name is not same")
//        }
//        switch param {
//        case .progressUpdated(let model,let progress):
//            self.progressUpdated(model: model, progress: progress)
//        case .statusUpdated(let models):
//            self.statusUpdated(models: models)
//        }
//    }
//}
///*************************************/
//
//// how to use
//class ClassA {
//    init() {
//        self.register()
//    }
//    deinit {
//        self.unregister()
//    }
//}
//
//extension ClassA:DownloadServiceListener {
//    func progressUpdated(model: String, progress: Float) {
//        
//        print("success, progressUpdate")
//    }
//    
//    func statusUpdated(models: [String]) {
//        print("success, statusUpdated")
//        print(models)
//    }
//}
//
//class AService{
//    func postNoti(){
//        DownloadServiceListenerParam.statusUpdated(models: [""]).post(object: self)
//    }
//}
