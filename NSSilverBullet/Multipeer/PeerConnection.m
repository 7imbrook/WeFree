//
//  PeerConnection.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 5/25/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "PeerConnection.h"

@implementation PeerConnection
{
    @private
    MCPeerID    *peerID;
    MCSession   *connectionManager;
}

- (instancetype)initPeerConnectionWithPeer:(MCPeerID *)peer manager:(MCSession *)manager
{
    self = [super init];
    if (self) {
        peerID = peer;
        connectionManager = manager;
    }
    return self;
}

@end
