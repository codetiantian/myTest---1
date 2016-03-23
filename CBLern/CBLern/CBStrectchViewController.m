//
//  CBStrectchViewController.m
//  CBLern
//
//  Created by Elaine on 15--19.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "CBStrectchViewController.h"
#import "CBStretchTableViewCell.h"

#define mainSize [UIScreen mainScreen].bounds.size
#define imageHeght  250

@interface CBStrectchViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) UIView *headView;
@property (weak, nonatomic) UITableView *myTableView;
@end

@implementation CBStrectchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNav];
    [self initMyTableView];
    [self initHeadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNav
{
    //  设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)initMyTableView
{
    UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, mainSize.width, mainSize.height - 64) style:UITableViewStyleGrouped];
    self.myTableView = myTableView;
    self.myTableView.backgroundColor = [UIColor clearColor];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    [self.view addSubview:self.myTableView];
}

- (void)initHeadView
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainSize.width, imageHeght - 64)];
    headView.backgroundColor = [UIColor clearColor];
    self.headView = headView;
    
    self.myTableView.tableHeaderView = self.headView;
}

#pragma mark - UItableView DataSource and Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.00001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellIndex = @"strectchCellIndex";
    CBStretchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellIndex];
    
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CBStretchTableViewCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainSize.width, 20)];
    footView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    return footView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        //  拉伸图片
        [self streatchImageViewWithFloat:0 - scrollView.contentOffset.y];
    }
    
    if (scrollView.contentOffset.y <= imageHeght - 64) {
        [self initNav];
    }
    
    if (scrollView.contentOffset.y >= imageHeght - 64) {
        [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[UIColor groupTableViewBackgroundColor]] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[self imageWithColor:[UIColor groupTableViewBackgroundColor]]];
    }
    
//    NSLog(@"***********%f", scrollView.contentOffset.y);
}

#pragma mark - 拉伸图片
- (void)streatchImageViewWithFloat:(CGFloat)y
{
    self.myImageView.transform = CGAffineTransformMakeScale(1, 1 + y / (imageHeght - 64));
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
