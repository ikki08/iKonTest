//
//  Post.m
//  iKonTest
//
//  Created by イッキ on 02/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import "Post.h"

@implementation Post

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if(self) {
        self.userId = [[dict objectForKey:@"userId"] integerValue];
        self.postId = [[dict objectForKey:@"id"] integerValue];
        self.title = [dict objectForKey:@"title"];
        self.body = [dict objectForKey:@"body"];
    }
    
    return self;
}

@end
