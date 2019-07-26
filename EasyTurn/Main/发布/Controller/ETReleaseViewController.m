//
//  ETReleaseViewController.m
//  EasyTurn
//
//  Created by 程立 on 2019/7/18.
//  Copyright © 2019 EasyTurn. All rights reserved.
//

#import "ETReleaseViewController.h"
#import "ETHomeViewController.h"
#import "ETRKongViewController.h"
@interface ETReleaseViewController ()

@end
@implementation ETReleaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    ETRKongViewController*et=[[ETRKongViewController alloc]init];
    [self.navigationController pushViewController:et animated:YES];
}

@end
