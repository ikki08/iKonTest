//
//  BaseViewModel.h
//  iKonTest
//
//  Created by イッキ on 02/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewModelDelegate <NSObject>
@optional

- (void)fetchDataDidSuccess;
- (void)fetchDataDidFailWithError:(NSError *)error;
- (void)filterPostsDidFinish;

@end

@interface BaseViewModel : NSObject

@property (strong, nonatomic, readonly) NSArray *filteredPosts;
@property (weak, nonatomic) id <BaseViewModelDelegate> delegate;

- (void)fetchData;
- (void)filterPostsWithKeyword:(NSString *)keyword;

@end

NS_ASSUME_NONNULL_END
