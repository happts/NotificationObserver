//
//  NotificationObserver.swift
//  NotificationObserver
//
//  Created by happts on 2020/11/17.
//  Copyright © 2020 happts. All rights reserved.
//

import Foundation
private let observerNotificationHandlerKey = "HTObserverNotificationHandlerKey" + UUID().uuidString
public protocol NotificationObserver:AnyObject{
    static var name:Notification.Name {get}
    func receive(notification:Notification)
    func register()
    func unregister()
}

extension NotificationObserver{
    private var notificationHandler:NotificationHandler {
        get{
            if let obj = objc_getAssociatedObject(self, observerNotificationHandlerKey) as? NotificationHandler {
                return obj
            }else {
                let handler = NotificationHandler()
                handler.observer = self
                objc_setAssociatedObject(self, observerNotificationHandlerKey, handler, .OBJC_ASSOCIATION_RETAIN)
                return handler
            }
        }
    }
    
    public func register(){
        NotificationCenter.default.addObserver(self.notificationHandler, selector: #selector(notificationHandler.receive(notification:)), name: Self.name, object: nil)
    }
    
    public func unregister(){
        NotificationCenter.default.removeObserver(self.notificationHandler, name: Self.name, object: nil)
    }
    
}

private final class NotificationHandler{
    weak var observer:NotificationObserver?
    
    @objc func receive(notification:Notification){
        observer?.receive(notification: notification)
    }
}
