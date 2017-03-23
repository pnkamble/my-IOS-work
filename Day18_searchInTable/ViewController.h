//
//  ViewController.h
//  Day18_searchInTable
//
//  Created by Student 12 on 3/21/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UITextField *searchText;
- (IBAction)searchAction:(id)sender;

@property NSArray *namelist;
@property NSArray *phonelist;
@property NSArray *resultAray;


@end

