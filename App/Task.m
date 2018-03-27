//
//  Task.m
//  App
//
//  Created by Ada 2018 on 21/03/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

#import "Task.h"

@implementation Task
- (instancetype)initWithText:(NSString *)text andTitle:(NSString *)title andDate:(NSString *)date
{
    self = [super init];
    if (self) {
        _text = text;
        _date = date;
        _title = title;
    }
    return self;
}
@end
