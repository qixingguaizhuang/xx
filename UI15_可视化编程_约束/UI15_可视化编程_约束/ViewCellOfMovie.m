//
//  ViewCellOfMovie.m
//  UI15_可视化编程_约束
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewCellOfMovie.h"

#import "ModelForList.h"

@interface ViewCellOfMovie ()

@property (retain, nonatomic) IBOutlet UIView *ViewOfBack;
@property (retain, nonatomic) IBOutlet UIView *ViewOfWhite;

@property (retain, nonatomic) IBOutlet UILabel *Tittle;
@property (retain, nonatomic) IBOutlet UILabel *beginTime;
@property (retain, nonatomic) IBOutlet UILabel *EndTime;
@property (retain, nonatomic) IBOutlet UILabel *categoryName;
@property (retain, nonatomic) IBOutlet UILabel *Wisher;
@property (retain, nonatomic) IBOutlet UILabel *ParticiPant;
@property (retain, nonatomic) IBOutlet UILabel *Address;


@end

@implementation ViewCellOfMovie

- (void)handleData:(ModelForList *)model{

    self.Tittle.text = model.title;
    self.beginTime.text = model.begin_time;
    self.EndTime.text = model.end_time;
    self.categoryName.text = model.category_name;
    self.Wisher.text = model.wisher_count.description;
    self.ParticiPant.text =model.participant_count.description;
    self.Address.text = model.address;


}


- (void)layoutSubviews{
    [super layoutSubviews];

    self.ViewOfBack.layer.cornerRadius = 10;
    self.ViewOfWhite.layer.cornerRadius = 8;
    self.ViewOfWhite.layer.shadowOffset = CGSizeMake(1, 1);
    self.ViewOfWhite.layer.shadowOpacity = 3;
    self.ViewOfWhite.layer.shadowColor = [UIColor grayColor].CGColor;

}










- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
