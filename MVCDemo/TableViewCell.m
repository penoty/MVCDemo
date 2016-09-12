//
//  TableViewCell.m
//  MVCDemo
//
//  Created by yupao on 9/12/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#define VIEW_GAP 5

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _iconView = [[UIImageView alloc] init];
        [_iconView setBackgroundColor:[UIColor redColor]];
        
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:20.f]];
        
        _textView = [[UITextView alloc] init];
        [_textView setFont:[UIFont systemFontOfSize:16.f]];
        [_textView setEditable:NO];
        
        _thumbUpBtn = [[UIButton alloc] init];
        [_thumbUpBtn setBackgroundColor:[UIColor grayColor]];
        
        [self addSubview:_iconView];
        [self addSubview:_titleLabel];
        [self addSubview:_textView];
        [self addSubview:_thumbUpBtn];
        
    }
    return self;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_iconView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(VIEW_GAP);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_right).with.offset(VIEW_GAP);
        make.centerY.equalTo(_iconView);
        make.height.equalTo(_iconView);
        make.right.equalTo(_thumbUpBtn.mas_left).with.offset(-VIEW_GAP);
    }];
    
    [_thumbUpBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-VIEW_GAP);
        make.centerY.equalTo(_iconView);
        make.size.equalTo(_iconView);
    }];
    
    [_textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake((_iconView.frame.size.height + VIEW_GAP), VIEW_GAP, -VIEW_GAP, -VIEW_GAP));
    }];
    
}

#pragma mark - update 
- (void)updateModel:(CellModel *)model {
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.url]];
    [_titleLabel setText:model.title ? model.title : @"无标题"];
    [_textView setText:model.content ? model.content : @"无内容"];
    [_thumbUpBtn setTitle:[NSString stringWithFormat:@"%d", model.thumbUpCount] forState:UIControlStateNormal];
    
}

@end
