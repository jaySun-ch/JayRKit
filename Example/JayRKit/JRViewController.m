//
//  JRViewController.m
//  JayRKit
//
//  Created by jaySun-ch on 07/27/2023.
//  Copyright (c) 2023 jaySun-ch. All rights reserved.
//

#import "JRViewController.h"
#import "JRDetialViewControllerGroup.h"


#define PushVC(_type_) \
_type_ *vc = [_type_ new];\
[self.navigationController pushViewController:vc animated:YES];

@interface JRViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *tableTitle;

@end

@implementation JRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubView:self.tableView];
    self.tableTitle = @[@"输入验证码样式",@"下拉输入框样式",@"模态弹窗样式"];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

JRCreateLazyLoad(UITableView *,tableView,^{
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
});

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableTitle.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0){
        PushVC(JRVerifyCodeInputViewController);
    }else if(indexPath.row  == 1){
        PushVC(JRDropTextFieldViewController);
    }else if(indexPath.row == 2){
        PushVC(JRPopTestViewController);
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.tableTitle[indexPath.row];
    return cell;
}



@end


