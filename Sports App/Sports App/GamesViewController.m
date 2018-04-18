//
//  GamesViewController.m
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import "GamesViewController.h"
#import "DAO.h"

@implementation GameTableViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    self.layer.cornerRadius = 20;
    self.layer.masksToBounds = YES;
}

- (void)formatCell:(long)row{
    NSString *key = [[[DAO sharedManager] games].allKeys objectAtIndex:row];
    
    Game *game = [[[DAO sharedManager] games] objectForKey:key];
    self.awayTeamLabel.text = game.awayTeam.name;
    self.homeTeamLabel.text = game.homeTeam.name;
    self.awayTeamScore.text = game.state.awayTeamScore;
    self.homeTeamScore.text = game.state.homeTeamScore;
    
    //game over
    if ([game.state.gameStatus isEqualToString:@"FINAL"]) {
        self.quarterLabel.alpha = 0;
        self.timeLabel.alpha = 0;
        self.channelLabel.alpha = 0;
        self.record1.alpha = 0;
        self.record2.alpha = 0;
        self.finalLabel.alpha = 1;
    }
    else{
        self.channelLabel.text = game.state.broadcast;
        self.channelLabel.alpha = 1;
        self.finalLabel.alpha = 0;
        self.timeLabel.text = game.state.timeLeftInQuarter;
        //scheduled
        if ([game.state.gameStatus isEqualToString:@"SCHEDULED"]){
            self.quarterLabel.alpha = 0;
            self.record1.alpha = 1;
            self.record2.alpha = 1;
            self.record1.text = game.homeTeam.record;
            self.record2.text = game.awayTeam.record;
        }
        //in progress
        else{
            self.quarterLabel.alpha = 1;
            self.timeLabel.alpha = 1;
            self.channelLabel.alpha = 1;
            self.record1.alpha = 0;
            self.record2.alpha = 0;
            self.quarterLabel.text = game.state.quarter;
        }
    }
    if ([game.state.gameStatus isEqualToString:@"SCHEDULED"]) {
        self.colorView.backgroundColor = [UIColor grayColor];
    }
    else if (game.state.awayTeamScore > game.state.homeTeamScore) {
        self.colorView.backgroundColor = game.awayTeam.color;
    }
    else{
        self.colorView.backgroundColor = game.homeTeam.color;
    }
}

@end

@implementation GamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTableView)
                                                 name:@"DataDownloaded"
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadTableView{
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[DAO sharedManager] games].allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gameCell"];
    
    if (cell == nil) {
        cell = [[GameTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"gameCell"];
    }
    //format each cell
    [cell formatCell: indexPath.section];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
