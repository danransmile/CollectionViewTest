//
//  HGSegmentedPageViewController.h
//  HGPersonalCenterExtend
//
//  Created by Arch on 2019/1/3.
//  Copyright © 2019 mint_bin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGTitleView.h"
#import "HGPageViewController.h"

@protocol HGCollectionViewControllerDelegate <NSObject>
- (void)collectionViewControllerLeaveTop;
- (void)collectionViewControllerWillBeginDragging;
- (void)collectionViewControllerDidEndDragging;
@optional
- (void)collectionViewControllerWillTransitionToPage:(NSInteger)page;
- (void)collectionViewControllerDidTransitionToPage:(NSInteger)page;
@end

@interface HGSegmentedPageViewController : UIViewController
@property (nonatomic, strong, readonly) HGTitleView *titleView;
@property (nonatomic, copy) NSArray<HGPageViewController *> *pageViewControllers;
@property (nonatomic) NSInteger originalPage;
@property (nonatomic, readonly) NSInteger selectedPage;
@property (nonatomic, strong, readonly) HGPageViewController *selectedPageViewController;
@property (nonatomic, weak) id<HGCollectionViewControllerDelegate> delegate;

- (void)makePageViewControllersScrollToTop;
- (void)makePageViewControllersScrollState:(BOOL)canScroll;
@end

