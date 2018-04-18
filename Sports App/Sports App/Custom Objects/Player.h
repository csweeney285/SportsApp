//
//  Player.h
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerStats.h"
#import "Team.h"

@interface Player : NSObject

- (id)initWithDict:(NSDictionary *)dict;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *teamId;
@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) PlayerStats *stats;
@property (strong, nonatomic) Team *team;

@end
