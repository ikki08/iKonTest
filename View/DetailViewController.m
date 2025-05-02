//
//  DetailViewController.m
//  iKonTest
//
//  Created by イッキ on 03/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import "DetailViewController.h"
#import "Post.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Post *post = self.viewModel.viewedPost;
    
    self.userIdLabel.text = [NSString stringWithFormat:@"%ld", post.userId];
    self.postIdLabel.text = [NSString stringWithFormat:@"%ld", post.postId];
    self.titleLabel.text = post.title;
    self.bodyLabel.text = post.body;
}

@end
