//
//  NearbyPeopleViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 2/1/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

@import AudioToolbox;

#import "NearbyPeopleViewController.h"
#import "UIImage+RoundedImage.h"
#import "NearbyScene.h"
#import "SettingsViewController.h"
#import <UIColor+Colours.h>
#import <AddressBook/AddressBook.h>
#import <CommonCrypto/CommonDigest.h>

@interface NearbyPeopleViewController ()

@property (strong, nonatomic) NearbyScene *scene;
@property BOOL presented;
@property BOOL promted;

@end

@implementation NearbyPeopleViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString*)md5HexDigest:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);

    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];

    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++)
        [ret appendFormat:@"%02x",result[i]];

    return ret;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _presented = NO;
    _promted = NO;
}

- (IBAction)cancel:(id)sender
{
    [MultipeerManager.sharedManager stop];
    [self dismissNearbyViewCompletion:^{
        //
    }];
}

- (void)presentNearbyViewCompletion:(void(^)())completion
{
    // Present the scene.
    _presented = YES;
    NSString *aEmail = [[NSUserDefaults standardUserDefaults] valueForKey:OTUserDefaultsGravatarEmailKey] ?: @"";
    NSString *email = [[aEmail stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] lowercaseString];
    NSString *emailMD5 = [self md5HexDigest:email];
    NSString *gravatarString = [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@?s=%@&d=%@", emailMD5, @"200", @"mm"];
    NSURLRequest *gravitar = [NSURLRequest requestWithURL:[NSURL URLWithString:gravatarString]];
    [NSURLConnection sendAsynchronousRequest:gravitar queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        UIImage *img;
        if (response) {
            img = [UIImage imageWithData:data];
        } else {
            img = [UIImage imageNamed:@"none"];
        }
        _scene = [[NearbyScene alloc] initWithSize:CGSizeMake(320, 320) andHeadImage:img];
        [(SKView *)self.view presentScene:_scene];
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.view.frame = ({
                CGRect frame = CGRectMake(0, 0, 320, 320);
                frame.origin.y = self.parentViewController.view.frame.size.height - frame.size.height;
                frame;
            });
        } completion:^(BOOL finished) {
            [_scene animateMainHeadToScreen];
            completion();
        }];
    }];
}

- (void)dismissNearbyViewCompletion:(void(^)())completion
{
    _presented = NO;
    [MultipeerManager.sharedManager start];
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.view.frame = CGRectOffset(self.view.frame, 0.0, 320);
    } completion:nil];
}

- (void)addHeadWithImage:(UIImage *)image named:(NSString *)name
{
    SKSpriteNode *newHead = [_scene floatingHeadWithImage:image name:name touchDelegate:self pulsing:NO];
    newHead.position = CGPointMake(_scene.frame.size.width / 2.0, 250);
    newHead.name = name;
    newHead.alpha = 0.0;
    [_scene addChild:newHead];
    NSArray *actions = @[[SKAction waitForDuration:2.5], [SKAction fadeAlphaTo:1.0 duration:0.3]];
    [newHead runAction:[SKAction group:actions]];
}

- (void)sprite:(SKSpriteNode *)node touched:(BOOL)touched
{
    NSLog(@"%@ touched", node.name);
    NSArray *peers = [MultipeerManager.sharedManager session].connectedPeers;
    NSArray *p = [peers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(MCPeerID *peer, NSDictionary *bindings) {
        return (peer.displayName == node.name);
    }]];
    MCPeerID *peer = p.firstObject;

    [[MultipeerManager.sharedManager session] sendData:[NSData dataWithBytes:"VIBRATE000" length:10] toPeers:@[peer] withMode:MCSessionSendDataReliable error:nil];
}

#pragma mark delegotsomethods

- (void)manager:(id)manager didDiscoverUser:(MCPeerID *)user withEmail:(NSString *)email
{
    NSLog(@"NBVC - %@ <%@>", user.displayName, email);
    if (!_presented) {
        [self presentNearbyViewCompletion:^{
            NSString *emailMD5 = [self md5HexDigest:email];
            NSString *gravatarString = [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@?s=%@&d=%@", emailMD5, @"200", @"mm"];
            NSURLRequest *gravitar = [NSURLRequest requestWithURL:[NSURL URLWithString:gravatarString]];
            [NSURLConnection sendAsynchronousRequest:gravitar queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                UIImage *img;
                if (response) {
                    img = [UIImage imageWithData:data];
                } else {
                    img = [UIImage imageNamed:@"none"];
                }
                [self addHeadWithImage:img named:user.displayName];
            }];
        }];
    } else {
        NSString *emailMD5 = [self md5HexDigest:email];
        NSString *gravatarString = [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@?s=%@&d=%@", emailMD5, @"200", @"mm"];
        NSURLRequest *gravitar = [NSURLRequest requestWithURL:[NSURL URLWithString:gravatarString]];
        [NSURLConnection sendAsynchronousRequest:gravitar queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            UIImage *img;
            if (response) {
                img = [UIImage imageWithData:data];
            } else {
                img = [UIImage imageNamed:@"none"];
            }
            [self addHeadWithImage:img named:user.displayName];
        }];
    }

}

- (void)manager:(id)manager didLoseUser:(MCPeerID *)user
{
    SKNode *bye = [_scene childNodeWithName:user.displayName];
    [bye runAction:[SKAction fadeAlphaTo:0.0 duration:1.0] completion:^{
        [_scene removeChildrenInArray:@[bye]];
    }];
    if ([MultipeerManager.sharedManager session].connectedPeers.count <= 0) {
        [self dismissNearbyViewCompletion:^{
            NSLog(@"Goodbye");
        }];
    }
}

- (void)manager:(id)manager peerDidInstantiateScheduler:(MCPeerID *)peer
{
    if (_promted) {
        return;
    }
    _promted = YES;
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    dispatch_sync(dispatch_get_main_queue(), ^{
        UIAlertView *ask = [[UIAlertView alloc] initWithTitle:peer.displayName message:[NSString stringWithFormat:@"%@ would like to find when you're free.", peer.displayName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [ask show];
    });
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSLog(@"Connect");
    }
    _promted = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
