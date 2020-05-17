//
//  HGSegmentedPageViewController.m
//  HGPersonalCenterExtend
//
//  Created by Arch on 2019/1/3.
//  Copyright © 2019 mint_bin. All rights reserved.
//

#import "HGCollectionViewController.h"
#import "HGPagesViewController.h"

#define kWidth self.view.frame.size.width

@interface HGCollectionViewController () <HGTitleViewDelegate, HGPagesViewControllerDelegate>
@property (nonatomic, strong) HGTitleView *titleView;
@property (nonatomic, strong) HGPagesViewController *pagesViewController;
@property (nonatomic) BOOL isDragging;
@end

@implementation HGCollectionViewController
@synthesize originalPage = _originalPage;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self configUI];
}

-(void)configUI{
    _titleView = [[HGTitleView alloc] init];
    _titleView.delegate = self;
    [self.view addSubview:self.titleView];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(self.titleView.height);
    }];
    
    _pagesViewController = [[HGPagesViewController alloc] init];
    _pagesViewController.delegate = self;
    [self.view addSubview:self.pagesViewController.view];
    
    [self.pagesViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark - Public Methods
- (void)makePageViewControllersScrollToTop {
    [self.pagesViewController makeViewControllersScrollToTop];
}

- (void)makePageViewControllersScrollState:(BOOL)canScroll {
    [self.pageViewControllers enumerateObjectsUsingBlock:^(HGPageViewController * _Nonnull controller, NSUInteger index, BOOL * _Nonnull stop) {
        controller.canScroll = canScroll;
    }];
}

#pragma mark - HGCategoryViewDelegate
- (void)categoryViewDidSelectedItemAtIndex:(NSInteger)index {
    self.isDragging = NO;
    [self.pagesViewController setSelectedPage:index animated:NO];
}

#pragma mark - HGPagesViewControllerDelegate
- (void)pagesViewControllerLeaveTop {
    if ([self.delegate respondsToSelector:@selector(collectionViewControllerLeaveTop)]) {
        [self.delegate collectionViewControllerLeaveTop];
    }
}

- (void)pagesViewControllerWillBeginDragging {
    self.isDragging = YES;
    if ([self.delegate respondsToSelector:@selector(collectionViewControllerWillBeginDragging)]) {
        [self.delegate collectionViewControllerWillBeginDragging];
    }
}

- (void)pagesViewControllerDidEndDragging {
    if ([self.delegate respondsToSelector:@selector(collectionViewControllerDidEndDragging)]) {
        [self.delegate collectionViewControllerDidEndDragging];
    }
}

- (void)pagesViewControllerScrollingToTargetPage:(NSInteger)targetPage sourcePage:(NSInteger)sourcePage percent:(CGFloat)percent {
    if (!self.isDragging) {
        return;
    }
    [self.titleView scrollToTargetIndex:targetPage sourceIndex:sourcePage percent:percent];
}

- (void)pagesViewControllerWillTransitionToPage:(NSInteger)page {
    if ([self.delegate respondsToSelector:@selector(collectionViewControllerWillTransitionToPage:)]) {
        [self.delegate collectionViewControllerWillTransitionToPage:page];
    }
}

- (void)pagesViewControllerDidTransitionToPage:(NSInteger)page {
    if ([self.delegate respondsToSelector:@selector(collectionViewControllerDidTransitionToPage:)]) {
        [self.delegate collectionViewControllerDidTransitionToPage:page];
    }
}

#pragma mark - Setters
- (void)setPageViewControllers:(NSArray<HGPageViewController *> *)pageViewControllers {
    _pageViewControllers = pageViewControllers;
    self.pagesViewController.viewControllers = pageViewControllers;
}

- (void)setOriginalPage:(NSInteger)originalPage {
    _originalPage = originalPage;
    self.titleView.originalIndex = originalPage;
}

- (NSInteger)originalPage {
    return self.titleView.originalIndex;
}

- (NSInteger)selectedPage {
    return self.titleView.selectedIndex;
}

- (HGPageViewController *)selectedPageViewController {
    return self.pagesViewController.selectedPageViewController;
}

@end
