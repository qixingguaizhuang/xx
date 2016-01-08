//
//  CellOFNews.h
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 GH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelOFNew;

@interface CellOFNews : UITableViewCell

- (void)passModel:(ModelOFNew *) model;

+(CGFloat)heightForCell:(ModelOFNew *)model;


@end
