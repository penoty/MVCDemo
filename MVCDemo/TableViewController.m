//
//  TableViewController.m
//  MVCDemo
//
//  Created by yupao on 9/12/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "CellModel.h"
#import "Masonry.h"
#define SECTION_NUMBER 1
#define ROW_HEIGHT 100.f
static const NSString *kIconUrl = @"http://imgsrc.baidu.com/forum/w%3D580/sign=84badcabf1d3572c66e29cd4ba126352/4f4c9e3df8dcd10034ca7363718b4710b8122fad.jpg";

@interface TableViewController () {
    NSMutableArray *modelArray;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TableViewController

#pragma mark - view cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initFakeData];
    [self initTableView];
    
}

#pragma mark - init and setting
- (void)initFakeData {
    
    NSArray *fakeDataArray = @[
                 @{@"url": kIconUrl,
                   @"title": @"title_1",
                   @"content": @"content_1..."
                   },
                 @{@"url": kIconUrl,
                   @"title": @"title_2",
                   @"content": @"content_2..."
                   },
                 @{@"url": kIconUrl,
                   @"title": @"title_3",
                   @"content": @"content_3..."
                   }
                 ];

    for (id fakeData in fakeDataArray) {
        CellModel *newModel = [CellModel modelWithData:fakeData];
        if (!modelArray) {
            modelArray = @[].mutableCopy;
        }
        [modelArray addObject:newModel];
    }
    
}

- (void)initTableView {
    
    _tableView = [[UITableView alloc] init];
    [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"table_view_cell"];
    [_tableView setDelegate:(id<UITableViewDelegate> _Nullable)self];
    [_tableView setDataSource:(id<UITableViewDataSource> _Nullable)self];
    
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [_tableView reloadData];
    
}

#pragma mark - thumbUpOn TableViewCell
- (void)thumbUpOnCell:(UIButton *)sender {
    
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:[sender convertPoint:CGPointZero toView:_tableView]];
    if (indexPath) {
        CellModel *model = [modelArray objectAtIndex:indexPath.row];
        [model thumbUp];
        [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}

#pragma  mark -tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return SECTION_NUMBER;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return modelArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"table_view_cell" forIndexPath:indexPath];
    if (![cell.thumbUpBtn.allTargets containsObject:self]) {
        [cell.thumbUpBtn addTarget:self action:@selector(thumbUpOnCell:) forControlEvents:UIControlEventTouchUpInside];
    }
    [cell updateModel:modelArray[indexPath.row]];
    return cell;

}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return ROW_HEIGHT;

}
@end
