//
//  PlainTranstionViewController.m
//  TransitionDemo
//
//  Created by 焦鹏 on 2017/10/23.
//  Copyright © 2017年 XES. All rights reserved.
//

#import "PlainTranstionViewController.h"
#import "PlainSecondViewController.h"
@interface PlainTranstionViewController ()

@end

@implementation PlainTranstionViewController

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    
    // For a Presentation:
    //      fromView = The presenting view.
    //      toView   = The presented view.
    // For a Dismissal:
    //      fromView = The presented view.
    //      toView   = The presenting view.
    UIView *fromView;
    UIView *toView;
    
    // In iOS 8, the viewForKey: method was introduced to get views that the
    // animator manipulates.  This method should be preferred over accessing
    // the view of the fromViewController/toViewController directly.
    // It may return nil whenever the animator should not touch the view
    // (based on the presentation style of the incoming view controller).
    // It may also return a different view for the animator to animate.
    //
    // Imagine that you are implementing a presentation similar to form sheet.
    // In this case you would want to add some shadow or decoration around the
    // presented view controller's view. The animator will animate the
    // decoration view instead and the presented view controller's view will
    // be a child of the decoration view.
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
//    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
//    toView.frame = [transitionContext finalFrameForViewController:toViewController];
    if ([toViewController isKindOfClass:[PlainSecondViewController class]]) {
        toView.frame = CGRectZero;
        [containerView addSubview:toView];
    }else{
        fromView.frame =  [transitionContext initialFrameForViewController:fromViewController];
        [containerView insertSubview:toView atIndex:0];
        //[containerView addSubview:fromView];
        fromView.center =  CGPointMake(CGRectGetMidX(containerView.frame), CGRectGetMidY(containerView.frame));
    }
    
    // We are responsible for adding the incoming view to the containerView
    // for the presentation/dismissal.
    
    
    toView.center = CGPointMake(CGRectGetMidX(containerView.frame), CGRectGetMidY(containerView.frame));
    
    [UIView animateWithDuration:transitionDuration animations:^{
        if ([toViewController isKindOfClass:[PlainSecondViewController class]]) {
            toView.frame = [transitionContext finalFrameForViewController:toViewController];
        }else{
            fromView.bounds =  CGRectZero;
        }
    } completion:^(BOOL finished) {
        // When we complete, tell the transition context
        // passing along the BOOL that indicates whether the transition
        // finished or not.
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return .5;
}

@end
