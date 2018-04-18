//
//  GameStats.m
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import "GameState.h"

@implementation GameState

- (id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.awayTeamScore = [dict objectForKey:@"away_team_score"] ?[NSString stringWithFormat:@"%@", [dict objectForKey:@"away_team_score"]] : @"";
        self.broadcast = [dict objectForKey:@"broadcast"] ? [dict objectForKey:@"broadcast"] : @"";
        self.ID = [dict objectForKey:@"id"] ? [dict objectForKey:@"id"] : @"";
        self.gameId = [dict objectForKey:@"game_id"] ? [dict objectForKey:@"game_id"] : @"";
        self.gameStatus = [dict objectForKey:@"game_status"] ? [dict objectForKey:@"game_status"] : @"";
        self.homeTeamScore = [dict objectForKey:@"home_team_score"] ? [NSString stringWithFormat:@"%@", [dict objectForKey:@"home_team_score"]] : @"";
        self.quarter = [dict objectForKey:@"quarter"] ? [self quarterToString:[[dict objectForKey:@"quarter"]intValue]]  : @"";
        //set the time to the game start if it is scheduled
        if ([self.gameStatus isEqualToString:@"SCHEDULED"]) {
            self.timeLeftInQuarter = [dict objectForKey:@"game_start"] ? [dict objectForKey:@"game_start"] : @"";
        }
        else{
            self.timeLeftInQuarter = [dict objectForKey:@"time_left_in_quarter"] ? [dict objectForKey:@"time_left_in_quarter"] : @"";
        }
    }
    return self;
}

- (NSString *)quarterToString:(int)quarter{
    NSString *quarterStr = @"";
    switch (quarter) {
        case 4:
            quarterStr = @"4th";
            break;
        case 3:
            quarterStr = @"3rd";
            break;
        case 2:
            quarterStr = @"2nd";
            break;
        case 1:
            quarterStr = @"1st";
            break;
        default:
            break;
    }
    return quarterStr;
}

@end
