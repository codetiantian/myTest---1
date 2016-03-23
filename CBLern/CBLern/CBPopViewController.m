//
//  CBPopViewController.m
//  CBLern
//
//  Created by Elaine on 15--6.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "CBPopViewController.h"

#define mainSize [UIScreen mainScreen].bounds.size
#define buttonWH    80

@interface CBPopViewController () 

@property (strong, nonatomic) NSMutableArray *arrayData;
@property (strong, nonatomic) NSArray *arrayImages;
@property (assign, nonatomic) BOOL isShow;

- (IBAction)showButtonClicked:(UIButton *)sender;
@end

@implementation CBPopViewController

- (NSMutableArray *)arrayData
{
    if (!_arrayData) {
        _arrayData = [NSMutableArray array];
    }
    
    return _arrayData;
}

- (NSArray *)arrayImages
{
    if (!_arrayImages) {
        _arrayImages = [NSArray arrayWithObjects:@"tabbar_compose_camera", @"tabbar_compose_idea", @"tabbar_compose_lbs", @"tabbar_compose_more", @"tabbar_compose_photo", @"tabbar_compose_review", nil];
    }
    
    return _arrayImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isShow = NO;
    
    [self createButtonWithImages:self.arrayImages];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createButtonWithImages:(NSArray *)arrayImages
{
    CGFloat spaceW = (mainSize.width - buttonWH * 3) / 4;
   
    NSInteger p = 1;
    
    for (NSInteger i = 0; i < arrayImages.count / 3; i++) {
        for (NSInteger j = 0; j < 3; j++) {
            UIButton *popButton = [[UIButton alloc] initWithFrame:CGRectMake(spaceW * (j + 1) + buttonWH * j, mainSize.height, buttonWH, buttonWH)];
            [popButton setBackgroundImage:[UIImage imageNamed:arrayImages[p - 1]] forState:UIControlStateNormal];
            popButton.tag = p;
            [popButton addTarget:self action:@selector(popButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.arrayData addObject:popButton];
            p++;
            
            [self.view addSubview:popButton];
        }
    }
}

#pragma mark - 按钮点击
- (void)popButtonClicked:(UIButton *)buttonSender
{
    NSLog(@"---点击了第%li个按钮", buttonSender.tag);
}

- (IBAction)showButtonClicked:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        sender.transform = CGAffineTransformRotate(sender.transform, M_PI_4);
    }];
    
    if (self.isShow) {
        [self hidenAllButtons];
        self.isShow = NO;
    } else {
        [self showAllButtons];
        self.isShow = YES;
    }
}

- (void)showAllButtons
{
    CGFloat spaceH = 50;
    CGFloat buttonY = mainSize.height - buttonWH * 3 - spaceH * 2;
    
    for (NSInteger i = 0; i < self.arrayData.count; i++) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i *0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIButton *popButton = self.arrayData[i];
            
            [UIView animateWithDuration:0.3 animations:^{
                CGRect rect = popButton.frame;
                rect.origin.y = buttonY + (i / 3) * (buttonWH + spaceH);
                popButton.frame = rect;
            }];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [UIView animateWithDuration:0.05 animations:^{
                    CGRect rect = popButton.frame;
                    rect.origin.y = buttonY + (i / 3) * (buttonWH + spaceH)+ 20;
                    popButton.frame = rect;
                }];
            });
            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
//                [UIView animateWithDuration:0.05 animations:^{
//                    CGRect rect = popButton.frame;
//                    rect.origin.y = buttonY + (i / 3) * (buttonWH + spaceH)- 20;
//                    popButton.frame = rect;
//                }];
//            });
//            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
//                [UIView animateWithDuration:0.05 animations:^{
//                    CGRect rect = popButton.frame;
//                    rect.origin.y = buttonY + (i / 3) * (buttonWH + spaceH)+ 20;
//                    popButton.frame = rect;
//                }];
//            });
            
        });
    }
}

- (void)hidenAllButtons
{
    for (NSInteger i = self.arrayData.count; i > 0; i--) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i * 0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            UIButton *popButton = self.arrayData[6 - i];
            
            [UIView animateWithDuration:0.3 animations:^{
                CGRect rect = popButton.frame;
                rect.origin.y = mainSize.height;
                popButton.frame = rect;
            }];
        });
    }
}

- (void)woca
{
    NSLog(@"------验证一下");
}


@end
