//
//  BaseViewModel.m
//  iKonTest
//
//  Created by イッキ on 02/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import "BaseViewModel.h"
#import "Post.h"

@implementation BaseViewModel

- (void)fetchData {
    NSString *dataUrl = @"https://jsonplaceholder.typicode.com/posts";

    NSURL *url = [NSURL URLWithString:dataUrl];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *downloadTask = [session dataTaskWithURL:url
                                                completionHandler:^(NSData *data,
                                                                    NSURLResponse *response,
                                                                    NSError *error) {
        if (error) {
            [self.delegate fetchDataDidFailWithError:error];
            return;
        }

        NSError *jsonError;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&jsonError];
        
        if (jsonError) {
            [self.delegate fetchDataDidFailWithError:jsonError];
            return;
        }
        
        NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in jsonArray) {
            Post *post = [[Post alloc] initWithDict:dict];
            [mutablePosts addObject:post];
        }
        
        self.posts = mutablePosts;
        mutablePosts = nil;
        [self.delegate fetchDataDidSuccess];
    }];

    [downloadTask resume];
}

@end
