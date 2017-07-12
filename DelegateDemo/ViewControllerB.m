//
//  ViewControllerB.m
//  DelegateDemo
//
//  Created by 李峰 on 2017/7/12.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@property (nonatomic, strong) UITextField *tx;

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"VCB";
    
    _tx = [[UITextField alloc] initWithFrame:CGRectMake(100, 250, 175, 30)];
    _tx.borderStyle = UITextBorderStyleRoundedRect;
    _tx.backgroundColor = [UIColor whiteColor];
    _tx.font = [UIFont systemFontOfSize:14];
    _tx.textColor = [UIColor darkGrayColor];
    _tx.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_tx];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(60, 300, 255, 40)];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn setTitle:@"send message to VCA" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn addTarget:self action:@selector(backActionClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)backActionClicked
{
    //当代理响应sendValue方法时，把_tx.text中的值传到VCA
    if ([_delegate respondsToSelector:@selector(sendValue:)]) {
        [_delegate sendValue:_tx.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
