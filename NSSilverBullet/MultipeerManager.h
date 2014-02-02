//
//  MultipeerManager.h
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/31/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

extern NSString *OTServiceName;

@protocol MultipeerNearbyDelegate <NSObject>

- (void)manager:(id)manager didDiscoverUser:(MCPeerID *)user;
- (void)manager:(id)manager didLoseUser:(MCPeerID *)user;

@end

@interface MultipeerManager : NSObject

@property (strong) MCSession *session;
@property (strong) NSMutableArray *peers;

@property (strong) id<MultipeerNearbyDelegate> delegate;

+ (instancetype)sharedManager;

- (void)start;

- (void)startAdvertising;
- (void)startListening;

- (void)stop;

@end
