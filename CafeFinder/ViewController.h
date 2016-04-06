//
//  ViewController.h
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/5.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController

@property (nonatomic, strong) CLLocationManager *locationManager;
-(void) sortArray:(NSMutableArray *)dicArray orderWithKey:(NSString *)key ascending:(BOOL)yesOrNo;
@end

