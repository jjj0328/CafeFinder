//
//  categoriesDomain.h
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/6.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iconDomain.h"
#import "IanDomain.h"

@interface categoriesDomain : IanDomain
@property (nonatomic,strong)iconDomain *icon;
@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *pluralName;
@property (nonatomic,strong) NSString *primary;
@property (nonatomic,strong) NSString *shortName;
@end
