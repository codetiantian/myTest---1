//
//  CBCreateButtonViewController.m
//  CBLern
//
//  Created by Elaine on 15--6.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "CBCreateButtonViewController.h"
#import <UIImageView+WebCache.h>

@interface CBCreateButtonViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *myImage;
- (IBAction)addBarButtonClicked:(UIBarButtonItem *)sender;
@property (assign, nonatomic) NSInteger buttonNum;

@property (strong, nonatomic) NSMutableArray *arrayButtons;

@end

@implementation CBCreateButtonViewController

- (NSMutableArray *)arrayButtons
{
    if (!_arrayButtons) {
        _arrayButtons = [NSMutableArray array];
    }
    
    return _arrayButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.buttonNum = 1;
    
    double currentTime = CACurrentMediaTime();
    
    [self createButtonWithNum:self.buttonNum];
    
    NSLog(@"-----%lf",CACurrentMediaTime() - currentTime);
    
    [self.myImage sd_setImageWithURL:[NSURL URLWithString:@"http://file.shidaiyinuo.com/201603/head_20160317871458191500.png"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createButtonWithNum:(NSInteger)buttonNum
{
    CGFloat buttonW = 150;
    CGFloat buttonH = 40;
    
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    
    CGFloat buttonSpaceW = (mainSize.width - buttonW * 2) / 3;
    CGFloat buttonSpaceH = 15;
    
    NSInteger p = 1;
    
    NSInteger numH = (buttonNum - 1) / 2 + 1;
    NSInteger numV = 2;
    
    for (NSInteger i = 0; i < numH; i++) {
        
        if ((buttonNum - 1) / 2 == 0) {
            numV = buttonNum / 2 + 1;
        } else {
            if (i < numH - 1) {
                numV = 2;
            }
            else {
                if (buttonNum % 2 == 0) {
                    numV = 2;
                } else {
                    numV = buttonNum % 2;
                }
            }
        }
        
        for (NSInteger j = 0; j < numV; j++) {
            UIButton *yhButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonSpaceW * (j + 1) + buttonW * j, buttonSpaceH * (i + 1) + buttonH * i + 64, buttonW, buttonH)];
            yhButton.backgroundColor = [UIColor greenColor];
            [yhButton setTitle:[NSString stringWithFormat:@"%li", p] forState:UIControlStateNormal];
            [yhButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            yhButton.tag = p;
            
            [self.arrayButtons addObject:yhButton];
            [yhButton addTarget:self action:@selector(yhButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            p++;
            
            [self.view addSubview:yhButton];
        }
        
    }
}

- (IBAction)addBarButtonClicked:(UIBarButtonItem *)sender {
    
    for (UIButton *button in self.arrayButtons) {
        [button removeFromSuperview];
    }
    
    self.buttonNum++;
    [self createButtonWithNum:self.buttonNum];
}

- (void)yhButtonClicked:(UIButton *)buttonSender
{
    NSLog(@"------点击了第%li个按钮", buttonSender.tag);
}

@end
