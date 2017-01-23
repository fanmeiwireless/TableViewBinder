//
//  UITableView+EasyTableView.m
//  EasyTableView
//
//  Created by 李传格 on 17/1/23.
//  Copyright © 2017年 fanmei. All rights reserved.
//

#import "UITableView+EasyTableView.h"
#import <objc/runtime.h>

@interface UITableView (EasyTableView_Interceptor)

@property (nonatomic, strong) TableViewInterceptor *etv_interceptor;

@end

@implementation UITableView (EasyTableView_Interceptor)

static int ketv_interceptor;

- (TableViewInterceptor *)etv_interceptor {
    return objc_getAssociatedObject(self, &ketv_interceptor);
}

- (void)setEtv_interceptor:(TableViewInterceptor *)etv_interceptor {
    objc_setAssociatedObject(self, &ketv_interceptor, etv_interceptor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UITableView (EasyTableView)

- (void)bindDelegateToInterceptor:(TableViewArrayInterceptor *)interceptor {
    self.etv_interceptor = interceptor;
    self.delegate = interceptor;
    self.dataSource = interceptor;
    interceptor.tableView = self;
}

@end
