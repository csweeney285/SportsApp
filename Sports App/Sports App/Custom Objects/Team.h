//
//  Team.h
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Team : NSObject

- (id)initWithDict: (NSDictionary*)dict;

@property (strong, nonatomic) NSString *abbrev;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSString *fullName;
@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *record;

@end
