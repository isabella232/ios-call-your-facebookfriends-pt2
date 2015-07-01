//
//  CFriend.h
//  ios-call-your-facebook-friends
//
//  Created by Ali Minty on 6/21/15.
//  Copyright (c) 2015 Ali Minty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFriend : NSObject

@property (nonatomic, copy) NSString *friendName;
@property (nonatomic, copy) NSString *friendID;

+ (id)addFriendWithName:(NSString *)friendName FriendID:(NSString *)friendID;

@end
