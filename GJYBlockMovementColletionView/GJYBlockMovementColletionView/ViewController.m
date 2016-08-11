//
//  ViewController.m
//  GJYBlockMovementColletionView
//
//  Created by GJYipode on 16/8/11.
//  Copyright © 2016年 GJYipode. All rights reserved.
//

#import "ViewController.h"


static NSString *const kCell = @"kCell";

@interface ViewController () <UICollectionViewDelegate , UICollectionViewDataSource>

@property (nonatomic , strong) UICollectionView * colletionView;

@property (nonatomic , strong) UICollectionViewFlowLayout * layout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.colletionView];
    
    _colletionView.delegate = self;
    _colletionView.dataSource = self;
    
    [_colletionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCell];
}

#pragma mark - UIColletionViewDatasouce 
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return  2;
    
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return cell;
}


- (UICollectionView *)colletionView {
    if (_colletionView == nil) {
        
        _layout = [UICollectionViewFlowLayout new];
        
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _layout.sectionInset = UIEdgeInsetsMake(40, 10, 10, 10);
        
        _layout.itemSize = CGSizeMake(80, 80);
        
        _colletionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:_layout];
    }
    return _colletionView;
}

@end
