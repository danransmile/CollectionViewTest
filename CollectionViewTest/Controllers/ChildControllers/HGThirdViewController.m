//
//  HGThirdViewController.m
//  HGPersonalCenterExtend
//
//  Created by Arch on 2017/6/16.
//  Copyright © 2017年 mint_bin. All rights reserved.
//

#import "HGThirdViewController.h"

static NSString *const ThirdViewControllerCollectionViewCellIdentifier = @"ThirdViewControllerCollectionViewCell";

@interface HGThirdViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@end

@implementation HGThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ThirdViewControllerCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = kRGBA(28, 162, 223, 1.0);
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark - Getters
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 10;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH - 50) / 2.0, 200);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.view addSubview:_collectionView];
           [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
               make.edges.equalTo(self.view);
           }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 解决categoryView在吸顶状态下，且collectionView的显示内容不满屏时，出现竖直方向滑动失效的问题
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor = [UIColor purpleColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ThirdViewControllerCollectionViewCellIdentifier];
    }
    return _collectionView;
}
@end
