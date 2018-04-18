//
//  Player.m
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import "PlayerStats.h"

@implementation PlayerStats

- (id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.assists = [dict objectForKey:@"assists"] ? [dict objectForKey:@"assists"] : @"";
        self.gameId = [dict objectForKey:@"game_id"] ? [dict objectForKey:@"game_id"] : @"";
        self.ID = [dict objectForKey:@"id"] ? [dict objectForKey:@"id"] : @"";
        self.nerd = [dict objectForKey:@"nerd"] ? [dict objectForKey:@"nerd"] : @"";
        self.playerId = [dict objectForKey:@"player_id"] ? [dict objectForKey:@"player_id"] : @"";
        self.points = [dict objectForKey:@"points"] ? [dict objectForKey:@"points"] : @"";
        self.rebounds = [dict objectForKey:@"rebounds"] ? [dict objectForKey:@"rebounds"] : @"";
//        self.teamId = [dict objectForKey:@"team_id"] ? [dict objectForKey:@"team_id"] : @"";
    }
    return self;
}

@end
