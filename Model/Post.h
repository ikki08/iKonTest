//
//  Post.h
//  iKonTest
//
//  Created by イッキ on 02/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

@property (assign, nonatomic) NSInteger userId;
@property (assign, nonatomic) NSInteger postId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *body;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
