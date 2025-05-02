//
//  DetailViewModel.h
//  iKonTest
//
//  Created by イッキ on 03/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewModel : NSObject

@property (strong, nonatomic) Post *viewedPost;

@end

NS_ASSUME_NONNULL_END
