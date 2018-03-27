//
//  ViewController.h
//  App
//
//  Created by Ada 2018 on 21/03/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerDelegate.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, ViewControllerDelegate>
@property (nonatomic, retain) NSMutableArray *tasks;
@property NSMutableArray *filteredTasks;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property BOOL isFiltered;

@end

