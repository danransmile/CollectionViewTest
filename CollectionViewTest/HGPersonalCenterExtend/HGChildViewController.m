//
//  HGChildViewController.m
//  HGPersonalCenterExtend
//
//  Created by Arch on 2017/6/16.
//  Copyright © 2017年 mint_bin. All rights reserved.
//

#import "HGChildViewController.h"
#import "HGTitleView.h"

@interface HGChildViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation HGChildViewController

#pragma mark - Public Methods
- (void)scrollToTop {
    [self.scrollView setContentOffset:CGPointZero];
}

#pragma mark - Setters
- (void)setCanScroll:(BOOL)canScroll {
    _canScroll = canScroll;
    self.scrollView.showsVerticalScrollIndicator = canScroll;
    if (!canScroll) {
        self.scrollView.contentOffset = CGPointZero;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.scrollView = scrollView;
    if (self.canScroll) {
        if (scrollView.contentOffset.y <= 0) {
//            self.canScroll = NO;
            if ([self.delegate respondsToSelector:@selector(pageViewControllerLeaveTop)]) {
                [self.delegate pageViewControllerLeaveTop];
            }
        }
    }
//    else {
//        self.canScroll = NO;
//    }
}

@end
