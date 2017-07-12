//
//  ViewController.m
//  DelegateDemo
//
//  Created by 李峰 on 2017/7/12.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"

@interface ViewControllerA ()<VcBDelegate>//遵循协议

@property (nonatomic, strong) UILabel *recievedLB;
@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _recievedLB = [[UILabel alloc] initWithFrame:CGRectMake(60, 250, 255, 30)];
    _recievedLB.text = @"prepare recieved data from VCB";
    _recievedLB.textAlignment = NSTextAlignmentCenter;
    _recievedLB.backgroundColor = [UIColor redColor];
    _recievedLB.textColor = [UIColor whiteColor];
    _recievedLB.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_recievedLB];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(60, 300, 255, 40)];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn setTitle:@"click Me To Jump VcB" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.navigationItem.title = @"VCA";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClicked
{
    ViewControllerB *vcB = [ViewControllerB new];
    vcB.delegate = self;
    [self.navigationController pushViewController:vcB animated:YES];
}

- (void)sendValue:(NSString *)value
{
    _recievedLB.text = value;
}

@end
