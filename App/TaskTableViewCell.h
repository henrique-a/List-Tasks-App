//
//  TaskTableViewCell.h
//  App
//
//  Created by Ada 2018 on 26/03/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel *taskDate;
@property (weak, nonatomic) IBOutlet UILabel *taskText;


@end
