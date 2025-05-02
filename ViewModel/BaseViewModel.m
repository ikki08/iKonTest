//
//  BaseViewModel.m
//  iKonTest
//
//  Created by イッキ on 02/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import "BaseViewModel.h"
#import "Post.h"

@interface BaseViewModel ()

@property (strong, nonatomic) NSArray *posts;
@property (strong, nonatomic) NSArray *privateFilteredPosts;

@end

@implementation BaseViewModel

- (NSArray *)filteredPosts {
    return self.privateFilteredPosts ?: self.posts;
}

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

- (void)filterPostsWithKeyword:(NSString *)keyword {
    if (keyword.length == 0) {
        self.privateFilteredPosts = nil;
        [self.delegate filterPostsDidFinish];

        return;
    }

    NSMutableArray *results = [NSMutableArray array];
    for (Post *post in self.posts) {
        if ([[post.title lowercaseString] containsString:[keyword lowercaseString]]) {
            [results addObject:post];
        }
    }
    
    self.privateFilteredPosts = results;
    [self.delegate filterPostsDidFinish];
}

@end
