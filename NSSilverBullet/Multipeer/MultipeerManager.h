//
//  MultipeerManager.h
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/31/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
@class PeerConnection;
@class MultipeerManager;

extern NSString *OTServiceName;

/**
 *  The MultipeerNearbyDelegate when set will recieve updates with communtcation
 *  channels to nearby peers. When ready to connect to a peer you will connect
 *  on the PeerConnection.
 */
@protocol MultipeerNearbyDelegate <NSObject>

/**
 *  Notifies the delegate of a new user and passes an unstarted comm channel to 
 *  it.
 *
 *  @param manager The manager responible for finding the peer
 *  @param user    The unstarted comm channel to the user
 */
- (void)manager:(MultipeerManager *)manager didDiscoverUser:(PeerConnection *)user;

/**
 *  Notifiers te delegate if a peer disconnects for any reason
 *
 *  @param manager The manager handing the disconnected user
 *  @param user    The user that disconnected
 *  @param error   Any error if disconnection wasn't clean
 */
- (void)manager:(MultipeerManager *)manager didLoseUser:(PeerConnection *)user error:(NSError *)error;

@end

/**
 *  Manages the discovery of nearby peers and creates PeerConnections to handle
 *  communication between these peers.
 */
@interface MultipeerManager : NSObject

/**
 *  MCSession for this manager
 */
@property (strong) MCSession *session;

/**
 *  Info delegate
 */
@property (strong) id<MultipeerNearbyDelegate> delegate;

/**
 *  Start running the manager
 */
- (void)start;

/**
 *  Stop running the manager
 */
- (void)stop;

@end
