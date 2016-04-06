//
//  NSArray+map.m
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/6.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import "NSArray+map.h"

@implementation NSArray (map)
-(NSArray *) mapWithBlock:(id(^)(id item, NSInteger idx))block {
    if (!block) {
        return [NSArray arrayWithArray:self];
    }
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < [self count]; i ++){
        id val = [self objectAtIndex:i];
        id newVal = block(val,i);
        if(newVal){
            [arr addObject:newVal];
        }
        
    }
    return  [NSArray arrayWithArray:arr];
}

-(void) itWithBlock:(void(^)(__weak id item, NSInteger idx))block{
    if (block) {
        for (NSInteger i = 0; i < [self count]; i ++) {
            __weak id witem = [self objectAtIndex:i];
            block(witem, i);
        }
    }
}

@end
