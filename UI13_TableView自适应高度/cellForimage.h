//
//  cellForimage.h
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 GH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellForimage : UITableViewCell
@property (nonatomic, retain) UIImageView * imageViewForPic;


+ (CGFloat)heightForCellWithName:(NSString *)name;



@end



