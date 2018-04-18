//
//  GamesViewController.h
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GameTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayTeamLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamScore;
@property (weak, nonatomic) IBOutlet UILabel *awayTeamScore;
@property (weak, nonatomic) IBOutlet UILabel *quarterLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *channelLabel;
@property (weak, nonatomic) IBOutlet UILabel *finalLabel;
@property (weak, nonatomic) IBOutlet UILabel *record1;
@property (weak, nonatomic) IBOutlet UILabel *record2;

@end



@interface GamesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
