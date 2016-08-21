//
//  RootViewController.m
//  NSNotificationByValue
//
//  Created by mac1 on 16/8/21.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "RootViewController.h"
#import "ModalViewControler.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1) 设置背景颜色
    self.view.backgroundColor = [UIColor cyanColor];
    
    //2) 设置一个Label
    //a) 创建一个Label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 100, 270, 30)];
    //b) 设置该label的tag
    label.tag = 1000;
    //c) 设置label的内容
    label.text = @"通知的传值显示";
    //d) 设置背景颜色
    label.backgroundColor = [UIColor orangeColor];
    //e) 设置字体颜色
    label.textColor = [UIColor whiteColor];
    //f) 设置居中方式
    label.textAlignment = NSTextAlignmentCenter;
    //g) 添加label
    [self.view addSubview:label];
    
    //3) 设置跳转你的button
    //a) 创建button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    //b) 设置其frame
    button.frame = CGRectMake(0, 0, 200, 30);
    //c) 设置其在屏幕的中心
    button.center = self.view.center;
    //d) 设置背景颜色
    button.backgroundColor = [UIColor lightGrayColor];
    //e) 设置显示的内容
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    //f) 设置相应事件
    [button addTarget:self
               action:@selector(buttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    //g) 添加到页面上
    [self.view addSubview:button];
    
    //4) 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:kTextFieldTextChangeNotification
                                               object:nil];
    
}

#pragma mark - 点击的按键响应
- (void) buttonAction: (UIButton *) button {
    
    //1. 定义一个模态视图
    ModalViewControler *modalViewController = [[ModalViewControler alloc] init];
    
    //2. 设置弹窗方式
    modalViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    //3. 模态视图
    [self presentViewController:modalViewController animated:YES completion:nil];
    
}

#pragma mark - 接受通知的方法
- (void) receiveNotification: (NSNotification *) notification {
    
    //1) 通过tag获取页面的label
    UILabel *label = (UILabel *) [self.view viewWithTag:1000];
    
    //2) 修改label上的值
    label.text = notification.userInfo[@"text"];
    
}

#pragma mark - 移除通知的监听对象
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
