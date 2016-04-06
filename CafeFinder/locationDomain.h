//
//  locationDomain.h
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/6.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import "IanDomain.h"

@interface locationDomain : IanDomain
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *cc;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSNumber *distance;
//@property (nonatomic, strong) NSString *formattedAddress;
@property (nonatomic, strong) NSNumber *lat;
@property (nonatomic, strong) NSNumber *lng;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *state;
@end
