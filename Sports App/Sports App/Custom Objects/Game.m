//
//  Game.m
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import "Game.h"

@implementation Game

- (id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.awayTeamId = [dict objectForKey:@"away_team_id"] ? [dict objectForKey:@"away_team_id"] : @"";
        self.homeTeamId = [dict objectForKey:@"home_team_id"] ? [dict objectForKey:@"home_team_id"] : @"";
        self.ID = [dict objectForKey:@"id"] ? [dict objectForKey:@"id"] : @"";
        self.date = [dict objectForKey:@"date"] ? [dict objectForKey:@"date"] : @"";
    }
    return self;
}

@end
