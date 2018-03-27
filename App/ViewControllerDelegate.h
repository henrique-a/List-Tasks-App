//
//  ViewControllerDelegate.h
//  App
//
//  Created by Ada 2018 on 23/03/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@protocol ViewControllerDelegate <NSObject>
- (void)addTask:(Task *) task;
- (void)editTask:(Task *)task withIndex:(NSInteger *)index;
@end
