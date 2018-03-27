//
//  Task.h
//  App
//
//  Created by Ada 2018 on 21/03/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject
@property NSString *title;
@property NSString *text;
@property NSString *date;

- (instancetype)initWithText:(NSString *)text andTitle:(NSString *)title andDate:(NSString *)date;

@end
