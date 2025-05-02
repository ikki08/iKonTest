//
//  DetailViewController.h
//  iKonTest
//
//  Created by イッキ on 03/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *userIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *postIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@property (strong, nonatomic) DetailViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
