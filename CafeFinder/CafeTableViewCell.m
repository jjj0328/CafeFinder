//
//  CafeTableViewCell.m
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/6.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import "CafeTableViewCell.h"

#define EMPTY_IF_NIL(str) (str == nil ? @"" : (str == (id)[NSNull null] ? @"" : str))   //display space if string is nil or nunull class

@interface CafeTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *cafeName;
@property (weak, nonatomic) IBOutlet UILabel *cafeAddress;
@property (weak, nonatomic) IBOutlet UILabel *cafeDistance;

@property (nonatomic,strong) NSArray *venues;
@end
@implementation CafeTableViewCell
+(instancetype)newInstance{
    CafeTableViewCell *inst =(CafeTableViewCell*)[[NSBundle mainBundle] loadNibNamed:@"CafeTableViewCell" owner:nil options:nil].firstObject;
    return inst;
}

- (void)awakeFromNib {
    // Initialization code
    
}

//reload data
-(void)reloadData:(id)data{
    self.venues = data;
    self.cafeName.text = EMPTY_IF_NIL([self.venues valueForKey:@"name"]);
    self.cafeAddress.text = [NSString stringWithFormat:@"%@ %@ %@ %@",EMPTY_IF_NIL([self.venues valueForKeyPath:@"location.address" ]),EMPTY_IF_NIL([self.venues valueForKeyPath:@"location.city"]),EMPTY_IF_NIL([self.venues valueForKeyPath:@"location.postalCode"]),EMPTY_IF_NIL([self.venues valueForKeyPath:@"location.country"])];
    self.cafeDistance.text =[NSString stringWithFormat:@"%@m",[self.venues valueForKeyPath:@"location.distance"]];
    
    if (![self.venues valueForKeyPath:@"contact.phone"]) {
        self.cafePhone.hidden = YES; //hidden phonecall button while without phone number;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
