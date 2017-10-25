//
//  PlainFirstViewController.m
//  TransitionDemo
//
//  Created by 焦鹏 on 2017/10/23.
//  Copyright © 2017年 XES. All rights reserved.
//

#import "PlainFirstViewController.h"
#import "PlainSecondViewController.h"
#import "PlainTranstionViewController.h"

@interface PlainFirstViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation PlainFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonTapped:(id)sender {
    PlainSecondViewController* vc = [PlainSecondViewController new];
    vc.modalTransitionStyle = UIModalPresentationFullScreen;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [PlainTranstionViewController new];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [PlainTranstionViewController new];
}

@end
