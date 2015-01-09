//
//  Product.m
//  Decoyy
//
//  Created by Andrew Liu on 1/8/15.
//  Copyright (c) 2015 Andrew Liu. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype)initWithName:(NSString *)name withAddress:(NSString *)address withImage:(UIImage *)image;
{
    self = [super init];
    self.name = name;
    self.address = address;
    self.image = image;
    if ([name isEqualToString:@"SOUVLA"])
    {
        self.location = [[CLLocation alloc]initWithLatitude:37.7766295 longitude:-122.4250357];
    }
    else if ([name isEqualToString:@"MARLA BAKERY"])
    {
        self.location = [[CLLocation alloc]initWithLatitude:37.7755094 longitude:-122.4976948];
    }
    return self;
}

@end
