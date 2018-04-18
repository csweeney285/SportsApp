//
//  DAO.h
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"
#import "Player.h"
#import "PlayerStats.h"
#import "Game.h"
#import "GameState.h"

//Data Access Object
//This singleton will download, parse, and store the data json

@interface DAO : NSObject

+ (instancetype)sharedManager;
- (void)downloadJSON;

@property (nonatomic,strong) NSMutableDictionary *games;
@property (nonatomic,strong) NSMutableDictionary *players;

@end
