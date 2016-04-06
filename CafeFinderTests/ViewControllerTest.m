//
//  ViewControllerTest.m
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/6.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import <OCMock/OCMock.h>
@interface ViewControllerTest : XCTestCase
@property (nonatomic)ViewController *vctotest;

@end

@implementation ViewControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vctotest = [[ViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.vctotest = nil;
}

-(void)testSortArray{
    NSDictionary *a={@{@"name":@"tom",@"sex":@"M",@"age":@"24"}};
    NSDictionary *b={@{@"name":@"Mike",@"sex":@"F",@"age":@"23"}};
    NSDictionary *c ={@{@"name":@"Ian",@"sex":@"M",@"age":@"18"}};
    NSMutableArray *originalArr = [[NSMutableArray alloc]initWithObjects:a,b,c, nil];
     NSMutableArray *expectedSortedArr = [[NSMutableArray alloc]initWithObjects:c,b,a,nil];
  [self.vctotest sortArray:originalArr orderWithKey:@"age" ascending:YES];
    
    
    
//    [self.vctotest sortArray:originalArr orderWithKey:nil ascending:YES];
    XCTAssertEqual(originalArr, expectedSortedArr);
    
}



@end
