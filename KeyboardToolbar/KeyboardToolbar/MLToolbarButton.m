//
//  MLToolbarButton.m
//  KeyboardToolbar
//
//  Created by zhoujr on 3/18/14.
//  Copyright (c) 2014 Maple Empire. All rights reserved.
//

#import "MLToolbarButton.h"

@implementation MLToolbarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.0];
        
        self.layer.cornerRadius = 5.0f;
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
        self.titleLabel.textColor = [UIColor redColor];
    }
    return self;
}

@end
