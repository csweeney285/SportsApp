//
//  Player.m
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.teamId = [dict objectForKey:@"team_id"] ? [dict objectForKey:@"team_id"] : @"";
        self.ID = [dict objectForKey:@"id"] ? [dict objectForKey:@"id"] : @"";
        self.name = [dict objectForKey:@"name"] ? [dict objectForKey:@"name"] : @"";
    }
    return self;
}

@end
