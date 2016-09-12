//
//  TableViewCell.h
//  MVCDemo
//
//  Created by yupao on 9/12/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"

@interface TableViewCell : UITableViewCell

//UI
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *thumbUpBtn;

//Model
- (void)updateModel:(CellModel *)model;

@end
