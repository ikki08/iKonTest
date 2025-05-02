//
//  ViewController.m
//  iKonTest
//
//  Created by イッキ on 02/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewModel = [[BaseViewModel alloc] init];
    [self.viewModel fetchData];
}


- (void)fetchDataDidSuccess {
    [self.postTableView reloadData];
}

- (void)fetchDataDidFailWithError:(NSError *)error {
    printf(@"error: %@", error.localizedDescription);
}

@end
