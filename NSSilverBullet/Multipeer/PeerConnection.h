//
//  PeerConnection.h
//  NSSilverBullet
//
//  Created by Michael Timbrook on 5/25/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "MultipeerManager.h"

@interface PeerConnection : NSObject

- (instancetype)initPeerConnectionWithPeer:(MCPeerID *)peer manager:(MCSession *)manager;

@end
