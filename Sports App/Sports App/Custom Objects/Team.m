//
//  Team.m
//  Sports App
//
//  Created by Conor Sweeney on 4/17/18.
//  Copyright © 2018 Conor Sweeney. All rights reserved.
//

#import "Team.h"

@implementation Team

- (id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.abbrev = [dict objectForKey:@"abbrev"] ? [dict objectForKey:@"abbrev"]: @"";
        self.city = [dict objectForKey:@"city"] ? [dict objectForKey:@"city"]: @"";
        if ([dict objectForKey:@"color"]) self.color = [self colorFromHexString:[dict objectForKey:@"color"]];
        self.fullName = [dict objectForKey:@"full_name"] ? [dict objectForKey:@"full_name"]: @"";
        self.ID = [dict objectForKey:@"id"] ? [dict objectForKey:@"id"]: @"";
        self.name = [dict objectForKey:@"name"] ? [dict objectForKey:@"name"]: @"";
        self.record = [dict objectForKey:@"record"] ? [dict objectForKey:@"record"]: @"";
    }
    return self;
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
