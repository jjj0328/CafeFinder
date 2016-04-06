//
//  NSArray+map.h
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/6.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (map)
-(NSArray *) mapWithBlock:(id(^)(id item, NSInteger idx))block;
-(void) itWithBlock:(void(^)(id item, NSInteger idx))block;
@end
