##使用UIImage+ATWatermark轻松为图片增加水印

###功能:
- 可以给UIImage类型的图片添加文字和图片两种类型的水印
- 可以选择添加水印的位置(顶部居中、底部居中、左上、右上、左下、右下)
- 如果自带的这些位置不能满足需求,还可以调整水印的偏移,从而使水印达到任何位置

###使用:

- 添加图片类水印<br>
  **image**      -- 要添加图片的水印<br>
  **attrString** -- 要作为水印的富文本<br>
  **position**   -- 水印的位置,为枚举类型<br>
  **offset**     -- 水印的偏移,在默认位置的基础上调整
```objc
+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfText:(NSAttributedString *)attrString;

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfText:(NSAttributedString *)attrString position:(ATWatermarkPositon)position;

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfText:(NSAttributedString *)attrString position:(ATWatermarkPositon)position offset:(CGPoint)offset;
```

- 添加文字类水印<br>
  **image**          -- 要添加图片的水印<br>
  **waterMaskImage** -- 要作为水印的图片<br>
  **position**       -- 水印的位置,为枚举类型<br>
  **offset**         -- 水印的偏移,在默认位置的基础上调整
```objc
+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfImage:(UIImage *)waterMaskImage;

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfImage:(UIImage *)waterMaskImage position:(ATWatermarkPositon) postion;

+ (instancetype)imageWithUIImage:(UIImage *)image watermarkOfImage:(UIImage *)waterMaskImage position:(ATWatermarkPositon) postion offset:(CGPoint)offset;
```
###注意:
1. 作为水印的图片都是按照原图大小绘制的
2. 富文本作为水印暂时只能使用所有文字的attribute属性为一致的情况
