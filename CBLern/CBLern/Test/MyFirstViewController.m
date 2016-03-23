//
//  MyFirstViewController.m
//  CBLern
//
//  Created by Elaine on 15--30.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "MyFirstViewController.h"

@interface MyFirstViewController ()

- (IBAction)backButtonClicked:(UIBarButtonItem *)sender;
@end

@implementation MyFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backButtonClicked:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
