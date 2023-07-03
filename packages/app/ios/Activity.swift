//
//  Activity.swift
//  app
//
//  Created by Leevi Aattola on 3.7.2023.
//

import Foundation
import ActivityKit


struct NotificationAttributes: ActivityAttributes {
  public typealias NotificationStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var mesage: String
  }
  
  var title: String
}

@objc(NativeActivityKit)
class NativeActivityKit: NSObject {
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
  
  @objc(start:resolver:rejecter:)
  func start(
    title: String,
    resolve: RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock
  ) -> Void {
    if #available(iOS 16.2, *) {
      let ilmoitus = NotificationAttributes(title: title)
    
      let initState = NotificationAttributes.NotificationStatus(mesage: "Testi!")
    

      let content = ActivityContent(state: initState, staleDate: nil, relevanceScore: 0.0)
      
      let activity = try! Activity.request(attributes: ilmoitus, content: content, pushType: nil)
      if (activity == nil) {
        let error = NSError(domain: "", code: 200, userInfo: nil)
        reject("COM_ERR", "Ei onnistunut", error)
        return print("Ei onnistunut")
      }
      
      print(activity)
      
      resolve(activity.pushToken)
      

          

    } else {
      let error = NSError(domain: "", code: 200, userInfo: nil)
      reject("OS_OLD", "old os", error)
      // Fallback on earlier versions
      print("Ei toimi hei päivitä ios")
    }
  }
}
