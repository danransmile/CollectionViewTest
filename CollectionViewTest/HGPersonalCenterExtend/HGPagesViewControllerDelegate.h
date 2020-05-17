//
//  HGPagesViewControllerDelegate.h
//  CollectionViewTest
//
//  Created by 刘艳芹 on 2020/5/17.
//  Copyright © 2020 刘艳芹. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HGPopGestureCompatibleCollectionView;

NS_ASSUME_NONNULL_BEGIN

@protocol HGPagesViewControllerDelegate <NSObject>
- (void)pagesViewControllerLeaveTop;
- (void)pagesViewControllerWillBeginDragging;
- (void)pagesViewControllerDidEndDragging;
- (void)pagesViewControllerScrollingToTargetPage:(NSInteger)targetPage sourcePage:(NSInteger)sourcePage percent:(CGFloat)percent;
@optional
- (void)pagesViewControllerWillTransitionToPage:(NSInteger)page;
- (void)pagesViewControllerDidTransitionToPage:(NSInteger)page;
@end

NS_ASSUME_NONNULL_END
