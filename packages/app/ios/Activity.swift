//
//  Activity.swift
//  app
//
//  Created by Leevi Aattola on 3.7.2023.
//

import Foundation
import ActivityKit

@available(iOS 16.2, *)
@objc(NativeActivityKit)
class NativeActivityKit: NSObject {
  var currActivity: Activity<NotificationAttributes>? = nil
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
  
  @objc(end:rejecter:)
  func end(
    _ resolve: RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock
  ) -> Void {
    let finalStatus = NotificationAttributes.NotificationStatus(mesage: "Heippa")
    if #available(iOS 16.2, *) {
      let finalContent = ActivityContent(state: finalStatus, staleDate: nil)

      Task {
          for activity in Activity<NotificationAttributes>.activities {
              await activity.end(finalContent, dismissalPolicy: .immediate)
              print("Ending the Live Activity: \(activity.id)")
          }
      }
      
      resolve("ok")
    } else {
      let error = NSError(domain: "", code: 200, userInfo: nil)
      reject("OS_OLD", "old os", error)
      // Fallback on earlier versions
    }
  }
  
  @objc(updateActivity:resolver:rejecter:)
  func updateActivity(
    msg: String,
    resolver resolve: RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock
  ) -> Void {
    let updatedStatus = NotificationAttributes.NotificationStatus(mesage: msg)
    let alertConfiguration = AlertConfiguration(title: "Hei heppu", body: "Päivitetty tämä juttu.", sound: .default)
    let updatedContent = ActivityContent(state: updatedStatus, staleDate: nil)
    
    Task {
      try! await Task.sleep(nanoseconds: UInt64(6) * NSEC_PER_SEC)
      for activity in Activity<NotificationAttributes>.activities {
          await activity.update(updatedContent, alertConfiguration: alertConfiguration)
          print("Updated the Live Activity: \(activity.id)")
      }
    }

    resolve("ok")
    return
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
      currActivity = activity
  
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
