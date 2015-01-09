//
//  User.h
//  Decoyy
//
//  Created by Andrew Liu on 1/8/15.
//  Copyright (c) 2015 Andrew Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface User : NSObject
@property NSString *name;
@property CLLocation *location;

- (instancetype)initWithName:(NSString *)name;

@end
