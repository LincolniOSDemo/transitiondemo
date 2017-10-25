//
//  PlainSecondViewController.m
//  TransitionDemo
//
//  Created by 焦鹏 on 2017/10/23.
//  Copyright © 2017年 XES. All rights reserved.
//

#import "PlainSecondViewController.h"

@interface PlainSecondViewController ()
@property(strong, nonatomic) UIButton* dismissButton;
@end

@implementation PlainSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    _dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [self.view addSubview:_dismissButton];
    [_dismissButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _dismissButton.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
}

-(void)dismiss:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
