//
//  cafeDomain.h
//  caffeineFinder
//
//  Created by Jiajia Jiang on 16/4/5.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "categoriesDomain.h"
#import "IanDomain.h"
#import "contactDomain.h"
#import "locationDomain.h"
@interface cafeDomain : IanDomain
//This model is incomplete ,only take some elements we need
@property (nonatomic, strong) NSString *allowMenuUrlEdit;
@property (nonatomic, strong) categoriesDomain *categories;
@property (nonatomic, strong) contactDomain *contact;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) locationDomain *location;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *referealId;
@property (nonatomic, strong) NSString *url;

@end
