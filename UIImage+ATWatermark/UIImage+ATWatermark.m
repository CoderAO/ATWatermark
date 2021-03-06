//
//  UIImage+ATWatermark.m
//  Watermark
//
//  Created by CoderAO on 15/6/28.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "UIImage+ATWatermark.h"

@implementation UIImage (ATWatermark)

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfText:(NSAttributedString *)attrString {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    return [UIImage imageWithUIImage:image watermarkOfText:attrString position:ATWatermarkPositonBottomRight offset:CGPointZero];
}

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfText:(NSAttributedString *)attrString position:(ATWatermarkPositon)position {
    return [UIImage imageWithUIImage:image watermarkOfText:attrString position:position offset:CGPointZero];
}

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfText:(NSAttributedString *)attrString position:(ATWatermarkPositon)position offset:(CGPoint)offset {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawAtPoint:CGPointZero];

    NSString *string = attrString.string;
    NSRange range = NSMakeRange(0, attrString.length);
    NSRangePointer p = &range;
    NSDictionary *attrDic = [attrString attributesAtIndex:0 effectiveRange:p];
    CGSize textSize = [string sizeWithAttributes:attrDic];

    CGPoint statrPoint = [UIImage watermarkStartPointWithImageSize:image.size watermarkSize:textSize position:position offset:offset];
    [attrString drawAtPoint:statrPoint];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}

- (instancetype)addWatermarkWithText:(NSAttributedString *)attrString {
    return [UIImage imageWithUIImage:self watermarkOfText:attrString];
}

- (instancetype)addWatermarkWithText:(NSAttributedString *)attrString position:(ATWatermarkPositon)position {
    return [UIImage imageWithUIImage:self watermarkOfText:attrString position:position];

}

- (instancetype)addWatermarkWithText:(NSAttributedString *)attrString position:(ATWatermarkPositon)position offset:(CGPoint)offset {
    return [UIImage imageWithUIImage:self watermarkOfText:attrString position:position offset:offset];
}

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfImage:(UIImage *)watermarkImage {
    return [UIImage imageWithUIImage:image watermarkOfImage:watermarkImage position:ATWatermarkPositonBottomRight offset:CGPointZero];
}

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfImage:(UIImage *)watermarkImage position:(ATWatermarkPositon) postion {
    return [UIImage imageWithUIImage:image watermarkOfImage:watermarkImage position:postion offset:CGPointZero];
}

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfImage:(UIImage *)watermarkImage position:(ATWatermarkPositon) postion offset:(CGPoint)offset {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawAtPoint:CGPointZero];

    CGPoint startPoint = [UIImage watermarkStartPointWithImageSize:image.size
                                                     watermarkSize:watermarkImage.size
                                                          position:postion
                                                            offset:offset];
    [watermarkImage drawAtPoint:startPoint];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}


- (instancetype)addWatermarkWithImage:(UIImage *)image {
    return [UIImage imageWithUIImage:self watermarkOfImage:image];
}

- (instancetype)addWatermarkWithImage:(UIImage *)waterMaskImage position:(ATWatermarkPositon) postion {
    return [UIImage imageWithUIImage:self watermarkOfImage:waterMaskImage position:postion];
}

- (instancetype)addWatermarkWithImage:(UIImage *)waterMaskImage position:(ATWatermarkPositon) postion offset:(CGPoint)offset {
    return [UIImage imageWithUIImage:self watermarkOfImage:waterMaskImage position:postion offset:offset];
}

+ (CGPoint)watermarkStartPointWithImageSize:(CGSize)imageSize watermarkSize:(CGSize)watermarkSize position:(ATWatermarkPositon)postion offset:(CGPoint) offset {
    static CGFloat defaultMagin = 5;

    CGFloat imageW = imageSize.width;
    CGFloat imageH = imageSize.height;

    CGFloat watermarkW = watermarkSize.width;
    CGFloat watermarkH = watermarkSize.height;

    CGFloat beginPointX = 0;
    CGFloat beginPointY = 0;

    CGFloat offsetX = offset.x;
    CGFloat offsetY = offset.y;

    switch (postion) {
        case ATWatermarkPositonTop:
            beginPointX = (imageW - watermarkW) * 0.5 + offsetX;
            beginPointY = defaultMagin + offsetY;
            break;
        case ATWatermarkPositonBottom:
            beginPointX = (imageW - watermarkW) * 0.5 + offsetX;
            beginPointY = imageH - watermarkH - defaultMagin + offsetY;
            break;
        case ATWatermarkPositonTopLeft:
            beginPointX = defaultMagin + offsetX;
            beginPointY = defaultMagin + offsetY;
            break;
        case ATWatermarkPositonTopRight:
            beginPointX = imageW - watermarkW - defaultMagin + offsetX;
            beginPointY = defaultMagin + offsetY;
            break;
        case ATWatermarkPositonBottomLeft:
            beginPointX = defaultMagin + offsetX;
            beginPointY = imageH - watermarkH - defaultMagin + offsetY;
            break;
        case ATWatermarkPositonBottomRight:
            beginPointX = imageW - watermarkW - defaultMagin + offsetX;
            beginPointY = imageH - watermarkH - defaultMagin + offsetY;
            break;
        default:{
            NSException *exception = [NSException exceptionWithName:@"" reason:@"there is something wrong with your watermark's position" userInfo:nil];
            [exception raise];
        }
            break;
    }
    return CGPointMake(beginPointX, beginPointY);
}


@end
