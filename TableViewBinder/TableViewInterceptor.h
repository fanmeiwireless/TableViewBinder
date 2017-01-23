//
//  TableViewInterceptor.h
//  EasyTableView
//
//  Created by 李传格 on 17/1/23.
//  Copyright © 2017年 fanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewInterceptor : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) id<UITableViewDelegate> delegate;
@property (nonatomic, weak) id<UITableViewDataSource> dataSource;

@end

@interface TableViewArrayInterceptor : TableViewInterceptor

@property (nonatomic, strong, readonly) NSArray *models;

- (instancetype)initWithModels:(NSArray *)models;

- (void)updateWithModels:(NSArray *)models;

#pragma mark - blocks

@property (nonatomic, copy) UITableViewCell *(^cellForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath, id model);

@end
