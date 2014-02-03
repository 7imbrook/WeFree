//
//  MultipeerManager.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/31/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "MultipeerManager.h"
#import "SettingsViewController.h"
#import "CompareViewController.h"

#define NSLog(...)

NSString *OTServiceName = @"OT-Nearby";

NSString* StringFromState(MCSessionState state) {
    NSString *stateString;
    switch (state) {
        case MCSessionStateConnected:
            stateString = @"MCSessionStateConnected";
            break;
        case MCSessionStateConnecting:
            stateString = @"MCSessionStateConnecting";
            break;
        case MCSessionStateNotConnected:
            stateString = @"MCSessionStateNotConnected";
            break;
    }
    return stateString;
}

@interface MultipeerManager () <MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate, MCSessionDelegate>

@property (strong) MCPeerID *peerid;
@property (strong) MCNearbyServiceAdvertiser *advertiser;
@property (strong) MCNearbyServiceBrowser *browser;

@property (strong) id target;
@property SEL selector;

@end

@implementation MultipeerManager
{
    dispatch_queue_t queue;
}

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

        queue = dispatch_queue_create("multipeer.timbrook.com", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)start
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:OTUserDefaultsDeviceSearchDisabledKey]) {
        return;
    }
    dispatch_async(queue, ^{
        _session = [[MCSession alloc] initWithPeer:_peerid];
        _session.delegate = self;
        [self startAdvertising];
        [self startListening];
    });
}

- (void)stop
{
    NSLog(@"Stopping...");
    dispatch_async(queue, ^{
        [_advertiser stopAdvertisingPeer];
        [_browser stopBrowsingForPeers];
        [_session disconnect];
    });
}

- (void)stopConnecting
{
    dispatch_async(queue, ^{
        [_advertiser stopAdvertisingPeer];
        [_browser stopBrowsingForPeers];
    });
}

- (void)startAdvertising
{
    [_advertiser startAdvertisingPeer];
    NSLog(@"Advertiser status: %@", _advertiser.debugDescription);
}

- (void)startListening
{
    [_browser startBrowsingForPeers];
    NSLog(@"Browser status: %@", _browser.debugDescription);
}

#pragma mark MCNearbyServiceAdvertiserDelegate

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID
                                                                            withContext:(NSData *)context
                                                                      invitationHandler:(void (^)(BOOL, MCSession *))invitationHandler
{
    NSLog(@"%@ requested invite in context %@", peerID.displayName, context);
    if ([context isEqualToData:[NSData dataWithBytes:"OPMT" length:4]] && ![[_session connectedPeers] containsObject:peerID]) {
        NSLog(@"Accepted");
        [_browser stopBrowsingForPeers];
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
    if ([[_session connectedPeers] containsObject:peerID]) {
        NSLog(@"Not connecting to %@", peerID.displayName);
        return;
    }
    [_advertiser stopAdvertisingPeer];
    NSLog(@"Inviting to session %@", _session);
    [_browser invitePeer:peerID toSession:_session withContext:[NSData dataWithBytes:"OPMT" length:4] timeout:10];
}

- (void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID
{
    NSLog(@"Lost peer %@", peerID.displayName);
    [_delegate manager:self didLoseUser:peerID];
}

#pragma mark MCSessionDelegate

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSLog(@"%@ got %@ from %@", _peerid, data, peerID);
    NSData *header = [data subdataWithRange:NSMakeRange(0, 10)];
    NSData *body = [data subdataWithRange:NSMakeRange(10, data.length - 10)];
    dispatch_sync(dispatch_get_main_queue(), ^{
        if ([header isEqualToData:[NSData dataWithBytes:"EMAIL00000" length:10]]) {
            NSString *email = [NSString stringWithUTF8String:body.bytes ?: ""];
            NSLog(@"Email: %@", email);
            [_delegate manager:self didDiscoverUser:peerID withEmail:email];
        } else if ([header isEqualToData:[NSData dataWithBytes:"VIBRATE000" length:10]]) {
            [_delegate manager:self peerDidInstantiateScheduler:peerID];
        } else if ([header isEqualToData:[NSData dataWithBytes:"ACTIVATE00" length:10]]) {
            [_delegate manager:self peerStartScheduler:peerID];
        }
    });
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
    NSLog(@"%@ changed State to %@", peerID.displayName, StringFromState(state));
    if (state == MCSessionStateConnected) {
        NSString *email = [[NSUserDefaults standardUserDefaults] valueForKey:OTUserDefaultsGravatarEmailKey] ?: @"";
        NSMutableData *data = [NSMutableData dataWithBytes:"EMAIL00000" length:10];
        [data appendData:[NSData dataWithBytes:email.UTF8String length:email.length]];
        [_session sendData:data toPeers:@[peerID] withMode:MCSessionSendDataReliable error:nil];
    } else if (state == MCSessionStateNotConnected) {
        [_delegate manager:self didLoseUser:peerID];
    }

}

- (void)session:(MCSession *)session didReceiveCertificate:(NSArray *)certificate fromPeer:(MCPeerID *)peerID certificateHandler:(void (^)(BOOL))certificateHandler
{
    certificateHandler(YES);
}

@end
