//
//  AddController.m
//  App
//
//  Created by Ada 2018 on 21/03/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

#import "AddController.h"
#import "Task.h"
#import "ViewController.h"


@interface AddController ()

@end

@implementation AddController

@synthesize textView = _textView;
@synthesize title = _title;
@synthesize date = _date;
@synthesize delegate = _delegate;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.title becomeFirstResponder];
    self.title.placeholder = @"Título";
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker setMinimumDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(selectDate:) forControlEvents:UIControlEventValueChanged];
    [self.date setInputView:datePicker];
    
    if (self.task != nil) {
        self.title.text = self.task.title;
        self.date.text = self.task.date;
        self.textView.text = self.task.text;
    }
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveTask:(id)sender {
    Task *task = [[Task alloc] initWithText:self.textView.text andTitle:self.title.text andDate:self.date.text];
    
    if (self.editing) {
        [self.delegate editTask:task withIndex:self.cellIndex];
    } else {
        [self.delegate addTask:task];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)selectDate:(id)sender {
    UIDatePicker *picker = (UIDatePicker*)self.date.inputView;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd/MM/yy";
    self.date.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:picker.date]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
