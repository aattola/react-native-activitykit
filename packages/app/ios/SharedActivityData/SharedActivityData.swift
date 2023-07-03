//
//  SharedActivityData.swift
//  SharedActivityData
//
//  Created by Leevi Aattola on 3.7.2023.
//

import ActivityKit

struct NotificationAttributes: ActivityAttributes {
  public typealias NotificationStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var mesage: String
  }
  
  var title: String
}
