//
//  CellOFNews.m
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 GH. All rights reserved.
//

#import "CellOFNews.h"
#import "ModelOFNew.h"


#define  WIDTH   [UIScreen mainScreen].bounds.size.width


@interface CellOFNews ()

@property (nonatomic, retain)UILabel *labelOfTitle;

@property (nonatomic, retain)UILabel *labelOfSummary;

@end




@implementation CellOFNews

- (void)dealloc{

    [_labelOfSummary release];
    [_labelOfTitle release];
    [super dealloc];

}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createSubviews];
    }

    return self;

}


- (void)createSubviews{


    self.labelOfTitle= [[UILabel alloc] init];
    
    self.labelOfSummary = [[UILabel alloc] init];
    
    [self.contentView addSubview:self.labelOfSummary];
    [self.contentView addSubview:self.labelOfTitle];
    
    [_labelOfTitle release];
    [_labelOfSummary release];



}

- (void)layoutSubviews{


    [super layoutSubviews];
    
    /** 子控件 frame 的设置 **/
    
     self.labelOfTitle.frame = CGRectMake(10, 10, WIDTH - 20, 50);
   self.labelOfSummary.frame = CGRectMake(10, 10 + 50 + 10, WIDTH - 20, [[self class] heightForLabel:self.labelOfSummary.text]);
    
    
     self.labelOfTitle.numberOfLines = 0;
    self.labelOfSummary.numberOfLines = 0;
    
    self.labelOfSummary.lineBreakMode = NSLineBreakByWordWrapping;

}




- (void)passModel:(ModelOFNew *) model{

      self.labelOfTitle.text = model.title;
    self.labelOfSummary.text = model.summary;

}


+ (CGFloat)heightForLabel:(NSString *)text{

    CGRect rect = [text boundingRectWithSize:CGSizeMake(WIDTH - 20, 0) options:1 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return  rect.size.height;


}


/** 返回每行的高度 调用这里 计算高度的方法 */

+ (CGFloat)heightForCell:(ModelOFNew *)model{
//
//    CGRect rect = [model.summary boundingRectWithSize:CGSizeMake(WIDTH ,0 ) options:1 attributes:@{NSFontAttributeName :[UIFont systemFontOfSize: 17]} context:nil];
    
  CGFloat height = [CellOFNews heightForLabel:model.summary];
    
    
    return  height + 10 + 50 + 10 + 10;

}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
