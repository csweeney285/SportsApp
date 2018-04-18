//
//  ViewController.m
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import "MainViewController.h"
#import "DAO.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //Set segment control font size here since it cannot be done with IB
    [self.segmentController setTitleTextAttributes: @{NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:18.0]} forState:UIControlStateNormal];
    //download data using DAO
    [[DAO sharedManager] downloadJSON];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchContainerView:(UISegmentedControl*)sender {
    //games
    if (sender.selectedSegmentIndex == 0) {
        [self subViewToFront:self.gameContainerView andToBack:self.statContainerView];
    }
    //stats
    else{
        [self subViewToFront:self.statContainerView andToBack:self.gameContainerView];
    }
}

- (void)subViewToFront:(UIView *)front andToBack:(UIView *)back{
    back.alpha = 0;
    back.userInteractionEnabled = NO;
    front.alpha = 1;
    front.userInteractionEnabled = YES;
    [self.view bringSubviewToFront:front];
}

@end
