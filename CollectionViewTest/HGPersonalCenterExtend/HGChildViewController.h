//
//  HGChildViewController.h
//  HGPersonalCenterExtend
//
//  Created by Arch on 2017/6/16.
//  Copyright © 2017年 mint_bin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGCollectionViewControllerDelegate.h"

@interface HGChildViewController : UIViewController
@property (nonatomic) BOOL canScroll;
@property (nonatomic, weak) id<HGCollectionViewControllerDelegate> delegate;
@property (nonatomic) NSInteger pageIndex;

- (void)scrollToTop;
@end
