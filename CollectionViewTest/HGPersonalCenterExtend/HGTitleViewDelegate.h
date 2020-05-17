//
//  HGTitleViewDelegate.h
//  CollectionViewTest
//
//  Created by 刘艳芹 on 2020/5/17.
//  Copyright © 2020 刘艳芹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HGTitleViewDelegate <NSObject>
@optional
- (void)categoryViewDidSelectedItemAtIndex:(NSInteger)index;
@end


NS_ASSUME_NONNULL_END
