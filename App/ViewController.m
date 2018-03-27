//
//  ViewController.m
//  App
//
//  Created by Ada 2018 on 21/03/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

#import "ViewController.h"
#import "AddController.h"
#import "TaskTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tasks = _tasks;
@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tasks = [[NSMutableArray alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 90.0;
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    self.isFiltered = NO;
    self.searchBar.delegate = self;
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear");

}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
    [self.tableView reloadData];


}

- (void) viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear");

}

- (void) viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear");

}

- (void) addTask:(Task *)task {
    if (![task.title isEqualToString:@""] || ![task.text isEqualToString:@""]) {
        [self.tasks addObject:task];
    }
}

- (void)editTask:(Task *)task withIndex:(NSInteger *)index {
   [self.tasks replaceObjectAtIndex:index withObject:task];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    if (self.isFiltered) {
        return [self.filteredTasks count];
    }
    return [self.tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier =@"TaskTableViewCell";
    
    TaskTableViewCell *cell = [tableView
                            dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Task *task = [self.tasks objectAtIndex:indexPath.row];
    if (self.isFiltered) {
        task = [self.filteredTasks objectAtIndex:indexPath.row];
    }
    cell.taskDate.text = task.date;
    cell.taskTitle.text = task.title;
    cell.taskText.text = task.text;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSInteger index = indexPath.row;
        [self.tasks removeObjectAtIndex:index];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        _isFiltered = false;
    } else {
        _isFiltered = true;
        self.filteredTasks = [[NSMutableArray alloc] init];
        for (Task *task in self.tasks) {
            NSRange nameRange = [task.title rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (nameRange.location != NSNotFound) {
                [self.filteredTasks addObject:task];
            }
        }
    }
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"add"]){
        AddController *controller = (AddController *)segue.destinationViewController;
        controller.delegate = self;
        controller.editing = NO;
    } else if ([segue.identifier isEqualToString:@"edit"]) {
        AddController *controller = (AddController *)segue.destinationViewController;
        TaskTableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        NSInteger index = indexPath.row;
        Task *task = [[Task alloc] initWithText:cell.taskText.text andTitle:cell.taskTitle.text andDate:cell.taskDate.text];
        controller.task = task;
        controller.delegate = self;
        controller.editing = YES;
        controller.cellIndex = index;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
