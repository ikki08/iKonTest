//
//  ViewController.h
//  iKonTest
//
//  Created by イッキ on 02/05/25.
//  Copyright © 2025 Rizki Dwi Putra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"

@interface BaseViewController : UIViewController <BaseViewModelDelegate>

@property (weak, nonatomic) IBOutlet UITableView *postTableView;

@end

