//
//  GameStats.h
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameState : NSObject

- (id)initWithDict:(NSDictionary *)dict;

@property (strong, nonatomic) NSString *awayTeamScore;
@property (strong, nonatomic) NSString *broadcast;
@property (strong, nonatomic) NSString *gameId;
@property (strong, nonatomic) NSString *gameStatus;
@property (strong, nonatomic) NSString *homeTeamScore;
@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *quarter;
@property (strong, nonatomic) NSString *timeLeftInQuarter;

@end
