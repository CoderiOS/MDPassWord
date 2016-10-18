//
//  ViewController.m
//  MDPassWord
//
//  Created by ccit on 16/10/17.
//  Copyright © 2016年 CCIT. All rights reserved.
//

#import "ViewController.h"
#import "MDPassWord.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *payBtn = [[UIButton alloc] init];
    payBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [payBtn setTitle:@"paypal" forState:UIControlStateNormal];
    [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    payBtn.backgroundColor = [UIColor colorWithRed:90 / 255.0 green:193 / 255.0 blue:247 / 255.0 alpha:1.0];
    [payBtn addTarget:self action:@selector(paypal:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn];
    
    NSString *vVfl = @"V:|-200-[payBtn(50)]";
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVfl options:0 metrics:nil views:@{@"payBtn":payBtn}];
    
    NSString *hVfl = @"H:|-60-[payBtn]-60-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVfl options:0 metrics:nil views:@{@"payBtn":payBtn}];
    [self.view addConstraints:vCons];
    [self.view addConstraints:hCons];
}

- (void)paypal:(UIButton *)sender {
    self.view.backgroundColor = [UIColor whiteColor];
    MDPassWord *md = [[MDPassWord alloc] initWithTitle:@"请输入支付密码"];
    
    md.showPassWord = ^(NSString *password){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"支付密码" message:password  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    };
    
    [self.view addSubview:md];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
