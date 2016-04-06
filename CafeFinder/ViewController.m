//
//  ViewController.m
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/5.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AFHTTPSessionManager.h"
#import "AFURLSessionManager.h"
#import "AFNetWorking.h"
#import "NSArray+map.h"
#import "cafeDomain.h"
#import "cafeInfoController.h"

#define CLIENTID @"ACAO2JPKM1MXHQJCK45IIFKRFR2ZVL0QASMCBCG5NPJQWF2G"
#define CLIENTSECRET @"YZCKUYJ1WHUV2QICBXUBEILZI1DMPUIDP5SHV043O04FKBHL"
#define QUERYKEYWORD @"coffee"
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_OS_9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
@interface ViewController ()<CLLocationManagerDelegate>
@property (nonatomic,assign) double latitude;
@property (nonatomic,assign) double longitude;
@property (nonatomic,strong) NSArray *venues;   

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"CafeFinder";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"LookForCoffee" forState:UIControlStateNormal];
    [button sizeToFit];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 10; //button round corner
    CGPoint point;
    point.x = [UIScreen mainScreen].bounds.size.width/2;
    point.y = [UIScreen mainScreen].bounds.size.height/2;
    [button setCenter:point]; //make the button in the middle;
    [self.view addSubview:button];
 }

//click the button to get data and enter coffee shop info page
-(void)tap{
    [self startStandardUpdates];
    
}

// initial CLLocation Manager
- (void)startStandardUpdates {
    // CLLocationManager *locationManager;
    //init location manager
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc]init];
    }else{
        //ios 9.0 method UIAlertController
        if (IS_OS_8_OR_LATER) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Fail to get your position" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //respond after click alertview bottom
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            //use in ios8 or below
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Fail to get your position" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
        }
    }
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 5.0;
    [self.locationManager requestAlwaysAuthorization];//ask for active locationManager
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *currentLocation = [locations lastObject];//last one in array is the current location
    CLLocationCoordinate2D location= currentLocation.coordinate;
    self.latitude =location.latitude;
    self.longitude =location.longitude;
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?client_id=%@&client_secret=%@&v=20130815&ll=%.1f,%.1f&query=%@",CLIENTID,CLIENTSECRET,self.latitude,self.longitude,QUERYKEYWORD];
    __weak ViewController *wself = self;
    //get json data from url
    AFHTTPSessionManager *managerURL = [AFHTTPSessionManager manager];
    [managerURL GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * task, id responseObject) {
       // NSLog(@"%@ ",responseObject);
        
        NSDictionary *bizDict = responseObject;
        NSArray *lists = [bizDict valueForKeyPath:@"response.venues"];

        NSMutableArray *sortVenue = [NSMutableArray arrayWithArray:lists];
        [self sortArray:sortVenue orderWithKey:@"location.distance" ascending:YES];//list sorted by distance in ascending order
        wself.venues = sortVenue;
        cafeInfoController *controller =[[cafeInfoController alloc]init];
        controller.cafeInfo = wself.venues;
        [wself.navigationController pushViewController:controller animated:YES];
        controller.title =@"CafeInfo";
        [wself.locationManager stopUpdatingLocation];
        
    } failure:^(NSURLSessionDataTask *task, NSError * error) {
        NSLog(@"Error: %@", error);
        
    }];
}

/*
 sort the array responded from the server by ascending order
 */
-(void) sortArray:(NSMutableArray *)dicArray orderWithKey:(NSString *)key ascending:(BOOL)yesOrNo{
    NSSortDescriptor *distanceDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:yesOrNo];
    NSArray *descriptors = [NSArray arrayWithObjects:distanceDescriptor,nil];
    [dicArray sortUsingDescriptors:descriptors];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Location failed %@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
