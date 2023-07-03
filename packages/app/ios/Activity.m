//
//  Activity.m
//  app
//
//  Created by Leevi Aattola on 3.7.2023.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(NativeActivityKit, NSObject)
  RCT_EXTERN_METHOD(start:(NSString *)title
                    resolver:(RCTPromiseResolveBlock)resolve
                    rejecter:(RCTPromiseRejectBlock)reject)

  RCT_EXTERN_METHOD(end:(RCTPromiseResolveBlock)resolve
                    rejecter:(RCTPromiseRejectBlock)reject)

  RCT_EXTERN_METHOD(updateActivity:(NSString *)msg
                    resolver:(RCTPromiseResolveBlock)resolve
                    rejecter:(RCTPromiseRejectBlock)reject)
@end
