//
//  CafeTableViewCell.h
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/6.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CafeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *cafePhone;

+(instancetype) newInstance;
-(void) reloadData:(id)data;
@end
