//
//  YNMeansViewController.m
//  CBLern
//
//  Created by Elaine on 15--24.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "YNMeansViewController.h"
#import "YNMeansView.h"

#define mainSize [UIScreen mainScreen].bounds.size

@interface YNMeansViewController () <UIScrollViewDelegate>

//@property (weak, nonatomic) UIScrollView *meansScrollView;
//@property (weak, nonatomic) UIView *meansView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation YNMeansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
//
//    [self initMeansView];
//    [self initMeansScrollView];
//    [self initImageView];
//    [self initLineView];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initMeansView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)initMeansView
//{
//    UIView *meansView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, mainSize.width - 50 * 2, 80)];
//    self.meansView = meansView;
//    [self.view addSubview:self.meansView];
//}
//
//#pragma mark - 初始化ScrollView
//- (void)initMeansScrollView
//{
//    UIScrollView *meansScrollView = [[UIScrollView alloc] initWithFrame:self.meansView.bounds];
//    
//    meansScrollView.contentInset = UIEdgeInsetsMake(0, self.meansView.frame.size.width / 2, 0, self.meansView.frame.size.width / 2);
//    meansScrollView.contentSize = CGSizeMake(10 * 50, 0);
//    meansScrollView.contentOffset = CGPointMake(50, 0);
//    meansScrollView.showsHorizontalScrollIndicator = NO;
//    meansScrollView.showsVerticalScrollIndicator = NO;
//    meansScrollView.bounces = NO;
//    meansScrollView.delegate = self;
//    
//    self.meansScrollView = meansScrollView;
//    
//    [self.meansView addSubview:self.meansScrollView];
//}
//
//- (void)initImageView
//{
//    int i = 0;
//    for (; i < 10; i++) {
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * 50, 0, 50, 30)];
//        
//        imageView.backgroundColor = [UIColor redColor];
//        
//        UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x - 25 , 35, 50, 13)];
//        numLabel.font = [UIFont systemFontOfSize:13];
//        numLabel.textColor = [UIColor blackColor];
//        numLabel.textAlignment = NSTextAlignmentCenter;
//        numLabel.text = [NSString stringWithFormat:@"%i", 30 + i * 10];
//        
//        [self.meansScrollView addSubview:imageView];
//        [self.meansScrollView addSubview:numLabel];
//    }
//    
//    if (i == 10) {
//        UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * 50 - 25 , 35, 50, 13)];
//        numLabel.font = [UIFont systemFontOfSize:13];
//        numLabel.textColor = [UIColor blackColor];
//        numLabel.textAlignment = NSTextAlignmentCenter;
//        numLabel.text = [NSString stringWithFormat:@"%i", 30 + i * 10];
//        
//        [self.meansScrollView addSubview:numLabel];
//    }
//}
//
//- (void)initLineView
//{
//    CGFloat lineX = (self.meansScrollView.frame.size.width - 0.5) / 2;
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(lineX, 0, 0.5, 33)];
//    lineView.backgroundColor = [UIColor greenColor];
//    [self.meansView addSubview:lineView];
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    NSLog(@"---------%f", scrollView.contentOffset.x);
//}

- (void)initMeansView
{
    YNMeansView *meansView = [[YNMeansView alloc] initWithFrame:CGRectMake(50, 100, mainSize.width - 50 * 2, 60)];
    [meansView initMeansViewWithValueMin:30 withValueMax:200];
    [self.view addSubview:meansView];
    
    __weak typeof(self) ws = self;
    meansView.block = ^(CGFloat result) {
        ws.resultLabel.text = [NSString stringWithFormat:@"%.0fkg", result];
    };
    
    [meansView getCurrentValue];
}

@end
