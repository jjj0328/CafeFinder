//
//  IanDomain.m
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/6.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import "IanDomain.h"
#import "RMMapper.h"

@implementation IanDomain
-(id)initWithDict:(NSDictionary *)dict{
    self = [self init];
    
    if (self && dict!= (id)[NSNull null]) {
        //Travesal all values, if it belongs to NSNull null then set nil
        NSArray *keys = [dict allKeys];
        NSMutableDictionary *tmp =[[NSMutableDictionary alloc]init];
        for (id key in keys) {
            id val = [dict objectForKey:key];
            if (val != [NSNull null]) {
                [tmp setObject:val forKey:key];
            }
        }
        self = [RMMapper populateObject:self fromDictionary:tmp];
    }
    return  self;
}

@end
