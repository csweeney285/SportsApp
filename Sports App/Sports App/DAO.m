//
//  DAO.m
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import "DAO.h"

@implementation DAO

+ (instancetype)sharedManager {
    static DAO *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (id)init{
    self = [super init];
    if (self) {
        self.players = [NSMutableDictionary new];
        self.games = [NSMutableDictionary new];
    }
    return self;
}

- (void)downloadJSON{
    //download and parse json in a background thread
    dispatch_queue_t myprocess_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(myprocess_queue, ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"basketballData" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
        
        //parse the dictionary
        //parse in this order to achieve max efficiency
        //I only need to save the dictionarys with games and players to access in my views
        
        //teams
        NSMutableDictionary *teams = [NSMutableDictionary new];
        NSArray *teamArr = [dict objectForKey:@"teams"];
        for (NSDictionary *teamDict in teamArr) {
            Team *team = [[Team alloc]initWithDict:teamDict];
            [teams setObject:team forKey:team.ID];
        }
        //player stats
        NSMutableDictionary *playerStatsDict = [NSMutableDictionary new];
        NSArray *playerStatArr = [dict objectForKey:@"player_stats"];
        for (NSDictionary *playerStatDict in playerStatArr) {
            PlayerStats *playerStats = [[PlayerStats alloc]initWithDict:playerStatDict];
            [playerStatsDict setObject:playerStats forKey:playerStats.ID];
        }
        //players
        NSArray *playerArr = [dict objectForKey:@"players"];
        for (NSDictionary *playerDict in playerArr) {
            Player *player = [[Player alloc]initWithDict:playerDict];
            player.stats = [playerStatsDict objectForKey:player.ID];
            player.team = [teams objectForKey:player.teamId];
            [self.players setObject:player forKey:player.ID];
        }
        //game state
        NSMutableDictionary *gameStatesDict = [NSMutableDictionary new];
        NSArray *gameStateArr = [dict objectForKey:@"game_states"];
        for (NSDictionary *gameStateDict in gameStateArr) {
            GameState *gameState = [[GameState alloc]initWithDict:gameStateDict];
            [gameStatesDict setObject:gameState forKey:gameState.gameId];
        }
        //game
        NSArray *gameArr = [dict objectForKey:@"games"];
        for (NSDictionary *gameDict in gameArr) {
            Game *game = [[Game alloc]initWithDict:gameDict];
            game.awayTeam = [teams objectForKey: game.awayTeamId];
            game.homeTeam = [teams objectForKey: game.homeTeamId];
            game.state = [gameStatesDict objectForKey:game.ID];
            [self.games setObject:game forKey:game.ID];
        }
        //post a notification instead of firing a delegate since both view controllers need this data
        //do this on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"DataDownloaded" object:nil];
        });
    });
}

@end
