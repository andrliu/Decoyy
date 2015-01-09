//
//  User.m
//  Decoyy
//
//  Created by Andrew Liu on 1/8/15.
//  Copyright (c) 2015 Andrew Liu. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    self.name = name;
    if ([name isEqualToString:@"A"])
    {
        self.location = [[CLLocation alloc]initWithLatitude:37.778665 longitude:-122.4222464];
    }
    else if ([name isEqualToString:@"B"])
    {
        self.location = [[CLLocation alloc]initWithLatitude:37.7774086 longitude:-122.4971447];
    }
    return self;
}

@end
