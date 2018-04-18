//
//  Player.h
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerStats : NSObject

- (id)initWithDict:(NSDictionary *)dict;

@property (strong, nonatomic) NSString *assists;
@property (strong, nonatomic) NSString *gameId;
@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *nerd;
@property (strong, nonatomic) NSString *playerId;
@property (strong, nonatomic) NSString *points;
@property (strong, nonatomic) NSString *rebounds;
//@property (strong, nonatomic) NSString *teamId;

@end
