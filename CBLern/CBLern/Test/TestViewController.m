//
//  TestViewController.m
//  CBLern
//
//  Created by Elaine on 15--30.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "TestViewController.h"
#import "MyFirstViewController.h"

@interface TestViewController ()

- (IBAction)testButtonClicked:(UIButton *)sender;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, 320, 20)];
    statusBarView.backgroundColor=[UIColor blackColor];
    [self.navigationController.navigationBar addSubview:statusBarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)testButtonClicked:(UIButton *)sender {
    MyFirstViewController *firstVC = [[MyFirstViewController alloc] initWithNibName:@"MyFirstViewController" bundle:nil];
    [self presentViewController:firstVC animated:YES completion:Nil];
}
@end
