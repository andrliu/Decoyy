//
//  Product.h
//  Decoyy
//
//  Created by Andrew Liu on 1/8/15.
//  Copyright (c) 2015 Andrew Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@import CoreLocation;

@interface Product : NSObject
@property NSString *name;
@property NSString *address;
@property CLLocation *location;
@property UIImage *image;
@property int distance;

- (instancetype)initWithName:(NSString *)name withAddress:(NSString *)address withImage:(UIImage *)image;

@end
