//
//  TableViewInterceptor.m
//  EasyTableView
//
//  Created by 李传格 on 17/1/23.
//  Copyright © 2017年 fanmei. All rights reserved.
//

#import "TableViewInterceptor.h"

@implementation TableViewInterceptor

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:NSStringFromSelector(@selector(tableView:numberOfRowsInSection:))]) {
        return YES;
    }
    else if ([NSStringFromSelector(aSelector) isEqualToString:NSStringFromSelector(@selector(tableView:cellForRowAtIndexPath:))]
             ) {
        return YES;
    }
    else if ([self.delegate respondsToSelector:aSelector]) {
        return YES;
    }
    else if ([self.dataSource respondsToSelector:aSelector]) {
        return YES;
    }
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:aSelector]) {
        return self.delegate;
    }
    else if ([self.dataSource respondsToSelector:aSelector]) {
        return self.dataSource;
    }
    
    return self;
}

@end

@interface TableViewArrayInterceptor ()

@property (nonatomic, strong) NSArray *models;

@end

@implementation TableViewArrayInterceptor

- (instancetype)initWithModels:(NSArray *)models {
    if (self = [super init]) {
        self.models = models;
    }
    return self;
}

- (void)updateWithModels:(NSArray *)models {
    self.models = models;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models ? self.models.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellForRowAtIndexPath) {
        return self.cellForRowAtIndexPath(tableView, indexPath, self.models[indexPath.row]);
    }
    else {
        return nil;
    }
}

@end
