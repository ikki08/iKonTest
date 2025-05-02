//
//  ViewController.m
//  iKonTest
//
//  Created by イッキ on 02/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import "BaseViewController.h"
#import "DetailViewController.h"
#import "DetailViewModel.h"
#import "Post.h"

@interface BaseViewController ()

@property (strong, nonatomic) BaseViewModel *viewModel;
@property (strong, nonatomic) Post *selectedPost;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewModel = [[BaseViewModel alloc] init];
    self.viewModel.delegate = self;
    [self.viewModel fetchData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        DetailViewController *destinationVC = (DetailViewController *)segue.destinationViewController;
        DetailViewModel *detailViewModel = [[DetailViewModel alloc] init];
        detailViewModel.viewedPost = self.selectedPost;
        destinationVC.viewModel = detailViewModel;
    }
}

#pragma mark - Table View Data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellID";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
        UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Post *post = [self.viewModel.posts objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld %@", (long)post.postId, post.title];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Table View Data delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedPost = [self.viewModel.posts objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark - BaseViewModelDelegate

- (void)fetchDataDidSuccess {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.postTableView reloadData];
    });
}

- (void)fetchDataDidFailWithError:(NSError *)error {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:error.localizedDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];

    [alert addAction:okAction];

    [self presentViewController:alert animated:YES completion:nil];
}

@end
