//
//  MultipeerManager.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/31/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "MultipeerManager.h"

#define NSLog(...)

NSString *OTServiceName = @"OT-Nearby";

@interface MultipeerManager () <MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate, MCSessionDelegate>

@property (strong) MCPeerID *peerid;
@property (strong) MCNearbyServiceAdvertiser *advertiser;
@property (strong) MCNearbyServiceBrowser *browser;

@property (strong) id target;
@property SEL selector;

@end

@implementation MultipeerManager

+ (instancetype)sharedManager
{
    static MultipeerManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [MultipeerManager new];
    });
    return manager;
}

- (id)init
{
    self = [super init];
    if (self) {
        _peerid = [[MCPeerID alloc] initWithDisplayName:[[NSUserDefaults standardUserDefaults] valueForKey:@"Display-name"] ?: [[UIDevice currentDevice] name]];
        _advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:_peerid discoveryInfo:nil serviceType:OTServiceName];
        _advertiser.delegate = self;

        _browser = [[MCNearbyServiceBrowser alloc] initWithPeer:_peerid serviceType:OTServiceName];
        _browser.delegate = self;

        _peers = [@[] mutableCopy];
    }
    return self;
}

- (void)start
{
    _session = [[MCSession alloc] initWithPeer:_peerid];
    _session.delegate = self;
    [self startAdvertising];
    [self startListening];
}

- (void)stop
{
    [_advertiser stopAdvertisingPeer];
    [_browser stopBrowsingForPeers];
    [_session disconnect];
}

- (void)startAdvertising
{
    [_advertiser startAdvertisingPeer];
}

- (void)startListening
{
    [_browser startBrowsingForPeers];
}

#pragma mark MCNearbyServiceAdvertiserDelegate

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID
                                                                            withContext:(NSData *)context
                                                                      invitationHandler:(void (^)(BOOL, MCSession *))invitationHandler
{
    NSLog(@"%@ requested invite in context %@", peerID.displayName, context);
    if ([context isEqualToData:[NSData dataWithBytes:"OPMT" length:4]] && ![_peers containsObject:peerID]) {
        [_peers addObject:peerID];
        NSLog(@"Accepted");
        invitationHandler(YES, _session);
    } else {
        NSLog(@"Rejected");
        invitationHandler(NO, nil);
    }
}

#pragma mark MCNearbyServiceBrowserDelegate

- (void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info
{
    NSLog(@"%@ has been found", peerID.displayName);
    if ([_peers containsObject:peerID]) {
        NSLog(@"Not connecting to %@", peerID.displayName);
        return;
    }
    [_peers addObject:peerID];
    [_browser invitePeer:peerID toSession:_session withContext:[NSData dataWithBytes:"OPMT" length:4] timeout:10];
}

- (void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID
{
    NSLog(@"Lost peer %@", peerID.displayName);
    [_peers removeObject:peerID];
}

#pragma mark MCSessionDelegate

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSLog(@"%@ got %@ from %@", _peerid, data, peerID);
}

- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{

}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{

}

- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{

}

- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    NSLog(@"Changed State to %@", state == MCSessionStateConnected ? @"Connected" : @"not connected");
    if (state == MCSessionStateConnected) {
        [_delegate manager:self didDiscoverUser:peerID];
    } else if (state == MCSessionStateNotConnected) {
        [_delegate manager:self didLoseUser:peerID];
    }

}

- (void)session:(MCSession *)session didReceiveCertificate:(NSArray *)certificate fromPeer:(MCPeerID *)peerID certificateHandler:(void (^)(BOOL))certificateHandler
{
    certificateHandler(YES);
}

@end
