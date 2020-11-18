//
//  NotificationPoster.swift
//  NotificationObserver
//
//  Created by happts on 2020/11/17.
//  Copyright © 2020 happts. All rights reserved.
//

import Foundation

public protocol NotificationParam {
    var name:Notification.Name {get}
    
    func post(object:Any?)
}

private var NotificationParamUserInfoKey:String{ "NotificationUserInfoKey" }
public extension NotificationParam {
    func post(object:Any?){
        NotificationCenter.default.post(name: self.name, object: object, userInfo: [NotificationParamUserInfoKey:self])
    }
}

public extension Notification {
    func getParamInfo<T:NotificationParam>()->T?{
        userInfo?[NotificationParamUserInfoKey] as? T
    }
}
