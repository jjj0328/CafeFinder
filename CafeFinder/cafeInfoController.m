//
//  cafeInfoController.m
//  CafeFinder
//
//  Created by Jiajia Jiang on 16/4/6.
//  Copyright © 2016年 Jiajia Jiang. All rights reserved.
//

#import "cafeInfoController.h"
#import "CafeTableViewCell.h"
#import "cafeDomain.h"
@interface cafeInfoController()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation cafeInfoController

-(void) viewDidLoad{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.tableView.dataSource = self;//dataSource
    self.tableView.delegate = self; //delegate
    [self.view addSubview:self.tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cafeInfo.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CafeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CafeTebleViewCell"];
    if (!cell) {
        cell = [CafeTableViewCell newInstance];
        cell.cafePhone.tag = indexPath.row; //make the 
        [cell .cafePhone addTarget:self action:@selector(callTheCafe:) forControlEvents:UIControlEventTouchUpInside];
    }
    cafeDomain *cafes = [self.cafeInfo objectAtIndex:indexPath.row];
    
    [cell reloadData:cafes];
    return cell;
}

//call the cafe if there is contact number
-(void)callTheCafe:(UIButton*)button{
    NSString *phoneNum = [[self.cafeInfo objectAtIndex:button.tag] valueForKeyPath:@"contact.phone"];
    NSLog(@"%@",phoneNum);
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNum]]];
}
@end
