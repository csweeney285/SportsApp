//
//  Game.h
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"
#import "GameState.h"

@interface Game : NSObject

- (id)initWithDict:(NSDictionary *)dict;

@property (strong, nonatomic) NSString *awayTeamId;
@property (strong, nonatomic) NSString *homeTeamId;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *ID;

@property (strong, nonatomic) Team *homeTeam;
@property (strong, nonatomic) Team *awayTeam;
@property (strong, nonatomic) GameState *state;

@end
