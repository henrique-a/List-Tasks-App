//
//  AddController.h
//  App
//
//  Created by Ada 2018 on 21/03/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerDelegate.h"
#import "Task.h"

@interface AddController : UIViewController
@property Task *task;
@property (weak, nonatomic) IBOutlet UITextField *title;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *date;
@property id<ViewControllerDelegate> delegate;
@property BOOL editing;
@property NSInteger cellIndex;

@end
