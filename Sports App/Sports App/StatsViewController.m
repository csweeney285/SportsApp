//
//  StatsViewController.m
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import "StatsViewController.h"
#import "DAO.h"
#import "Player.h"

@implementation StatTableViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    UIView *separatorLine = [[UIView alloc] initWithFrame:
                             CGRectMake(0, self.contentView.frame.size.height - 1.0,
                                        self.contentView.frame.size.width + 50, 1)];
    separatorLine.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview: separatorLine];
}

- (void)formatCell:(long)row{
    NSString *key = [[[DAO sharedManager] players].allKeys objectAtIndex: row];
    Player *player = [[DAO sharedManager].players objectForKey:key];
    self.playerLabel.text = [NSString stringWithFormat:@"%@ - %@",player.name,player.team.abbrev];
    self.pointsLabel.text = [NSString stringWithFormat:@"%@ Pts,",player.stats.points];
    self.assistsLabel.text = [NSString stringWithFormat:@"%@ Ast, %@ Reb",player.stats.assists, player.stats.rebounds];
    self.nerdLabel.text = [NSString stringWithFormat:@"%@",player.stats.nerd];
    [self.playerLabel sizeToFit];
    [self.pointsLabel sizeToFit];
    [self.assistsLabel sizeToFit];
    [self.nerdLabel sizeToFit];
}

@end


@implementation StatsViewController

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [DAO sharedManager].players.allKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"statCell"];
    
    if (cell == nil) {
        cell = [[StatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"statCell"];
    }
    //format each cell
    [cell formatCell: indexPath.row];
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
