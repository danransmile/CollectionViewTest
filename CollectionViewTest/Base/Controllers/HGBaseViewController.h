//
//  HGBaseViewController.h
//  HGPersonalCenterExtend
//
//  Created by Arch on 2019/5/15.
//  Copyright © 2019 mint_bin@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HGBaseViewController : UIViewController
@property (nonatomic) BOOL isHideStatusBar;
@property (nonatomic) BOOL isHiddenNavigationBarBottomBorder;

- (void)setNavigationBarAlpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
