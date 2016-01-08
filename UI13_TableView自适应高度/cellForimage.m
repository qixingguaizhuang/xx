//
//  cellForimage.m
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 GH. All rights reserved.
//

#import "cellForimage.h"



@implementation cellForimage

- (void)dealloc{
   
    [_imageViewForPic release];
    [super dealloc];

}


/** 初始化方法 */

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createSubViews];
    }

    return self;
}



- (void)createSubViews{

    self.imageViewForPic = [[UIImageView alloc] init];
    
    [self.contentView addSubview:self.imageViewForPic];
    [_imageViewForPic release];

}


// 获取高度

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageViewForPic.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, [[self class] heightForImage:self.imageViewForPic.image]);
    
    
}

+ (CGFloat)heightForImage:(UIImage *)image{


    return image.size.height / image.size.width
    * ([UIScreen mainScreen].bounds.size.width - 20);

}




    //计算高度算法, 等比例计算图片的高度

+ (CGFloat)heightForCellWithName:(NSString *)name{

    /** 创建 UIimage 对象.*/

    UIImage *image = [UIImage imageNamed:name];
    
    /**利用 image 的 size 属性计算高度 **/
    
    return  image.size.height / image.size.width * ([UIScreen mainScreen].bounds.size.width - 20) + 20;
    

}











- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
