//
//  UITableView+EasyTableView.h
//  EasyTableView
//
//  Created by 李传格 on 17/1/23.
//  Copyright © 2017年 fanmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewInterceptor.h"

@interface UITableView (EasyTableView)

// Interceptor will take over delegate and datasource of tableview, and has a default implement.
- (void)bindDelegateToInterceptor:(TableViewArrayInterceptor *)interceptor;

@end
