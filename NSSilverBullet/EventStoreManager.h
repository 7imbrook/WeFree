//
//  EventStoreManager.h
//  NSSilverBullet
//
//  Created by Piper Chester on 2/13/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventStoreManager : NSObject

- (void)checkEventStoreAccess;
- (void)requestEventStoreAccessWithCompletion:(void (^)(NSMutableArray *eventArray))completion;

@end
