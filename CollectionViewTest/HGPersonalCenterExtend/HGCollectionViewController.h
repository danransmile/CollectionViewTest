//
//  HGCollectionViewController.h
//  HGPersonalCenterExtend
//
//  Created by Arch on 2019/1/3.
//  Copyright © 2019 mint_bin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGTitleView.h"
#import "HGChildViewController.h"
#import "HGCollectionViewControllerDelegate.h"

@interface HGCollectionViewController : UIViewController
@property (nonatomic, strong, readonly) HGTitleView *titleView;
@property (nonatomic, copy) NSArray<HGChildViewController *> *pageViewControllers;
@property (nonatomic) NSInteger originalPage;
@property (nonatomic, readonly) NSInteger selectedPage;
@property (nonatomic, strong, readonly) HGChildViewController *selectedPageViewController;
@property (nonatomic, weak) id<HGCollectionViewControllerDelegate> delegate;

- (void)makePageViewControllersScrollToTop;
- (void)makePageViewControllersScrollState:(BOOL)canScroll;
@end

