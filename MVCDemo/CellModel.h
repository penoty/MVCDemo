//
//  CellModel.h
//  MVCDemo
//
//  Created by yupao on 9/12/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "BaseModel.h"

@interface CellModel : BaseModel

+ (instancetype)modelWithData:(id)data;

- (void)thumbUp;

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) NSInteger thumbUpCount;

@end
