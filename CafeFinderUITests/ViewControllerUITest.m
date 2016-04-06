//
//  ViewControllerUITest.m
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/7.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface ViewControllerUITest : XCTestCase
//@property(nonatomic)ViewController *vctoUITest;
@end

@implementation ViewControllerUITest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.continueAfterFailure = NO;
    
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testLookForCoffeeButtonExists{
    XCUIApplication *app =[[XCUIApplication alloc]init];
    XCUIElementQuery *query = [app buttons];
    XCUIElement *lookForCoffeeButton = query[@"lookForCoffeeButton"];
    
   // XCTAssertNotNil(lookForCoffeeButton.exists);
   
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
