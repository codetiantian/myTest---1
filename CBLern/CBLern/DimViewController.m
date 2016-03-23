//
//  DimViewController.m
//  CBLern
//
//  Created by Elaine on 15--5.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "DimViewController.h"
#import <GPUImage.h>

@interface DimViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@end

@implementation DimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self showDimImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showDimImage
{
    UIImage *inputImage = [UIImage imageNamed:@"xiaonuo_on"];
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
//    GPUImageSepiaFilter *stillImageFilter = [GPUImageSepiaFilter new];
    GPUImageiOSBlurFilter *blurFilter = [GPUImageiOSBlurFilter new];
    
    [stillImageSource addTarget:blurFilter];
    [blurFilter useNextFrameForImageCapture];
    [stillImageSource processImage];
    
    blurFilter.blurRadiusInPixels = 0.5f;
    UIImage *currentFilter = [blurFilter imageFromCurrentFramebuffer];
    self.imageView2.image = currentFilter;
}

@end
