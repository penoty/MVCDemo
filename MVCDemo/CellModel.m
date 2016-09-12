//
//  CellModel.m
//  MVCDemo
//
//  Created by yupao on 9/12/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

+ (instancetype)modelWithData:(id)data {
    CellModel *model = [[CellModel alloc] initModelWithData:data];
    model.thumbUpCount = 0;
    return model;
}

- (void)thumbUp {
    _thumbUpCount++;
}

@end
