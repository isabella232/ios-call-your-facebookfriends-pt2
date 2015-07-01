//
//  CFriend.m
//  ios-call-your-facebook-friends
//
//  Created by Ali Minty on 6/21/15.
//  Copyright (c) 2015 Ali Minty. All rights reserved.
//

#import "CFriend.h"

@implementation CFriend

+ (id)addFriendWithName:(NSString *)friendName FriendID:(NSString *)friendID
{
    CFriend *newFriend = [[self alloc] init];
    [newFriend setFriendName:friendName];
    [newFriend setFriendID:friendID];
    return newFriend;
}

@end
