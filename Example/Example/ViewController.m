//
//  ViewController.m
//  Example
//
//  Created by 敖然 on 15/6/28.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ATWatermark.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"dachui_ao"];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, image.size.width, image.size.height)];
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];

    UIImage *watermarkImage = [UIImage imageNamed:@"daka"];
    UIImage *imageWithImageWatermark = [UIImage imageWithUIImage:image watermarkOfImage:watermarkImage position:ATWatermarkPositonTopRight];
//    self.imageView.image = imageWithImageWatermark;

    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    attrDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrDict[NSFontAttributeName] = [UIFont systemFontOfSize:18.f];

    NSAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"by_coderAO" attributes:attrDict];
    UIImage *imageWithImageAndTextWatermark = [UIImage imageWithUIImage:imageWithImageWatermark watermarkOfText:attrString position:ATWatermarkPositonBottomLeft];
    self.imageView.image = imageWithImageAndTextWatermark;
}


@end
