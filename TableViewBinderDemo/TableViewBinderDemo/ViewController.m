//
//  ViewController.m
//  TableViewBinderDemo
//
//  Created by 李传格 on 17/1/23.
//  Copyright © 2017年 fanmei. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+EasyTableView.h"

@interface ViewController () <UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    TableViewArrayInterceptor *interceptor = [[TableViewArrayInterceptor alloc] initWithModels:@[@"hello", @"world", @"easy", @"tableview"]];
    [interceptor setCellForRowAtIndexPath:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath, id model) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = model;
        return cell;
    }];
    interceptor.delegate = self;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    [tableView bindDelegateToInterceptor:interceptor];
    [self.view addSubview:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
