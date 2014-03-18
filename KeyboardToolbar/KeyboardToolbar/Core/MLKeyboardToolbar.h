//
//  MLKeyboardToolbar.h
//  KeyboardToolbar
//
//  Created by zhoujr on 3/18/14.
//  Copyright (c) 2014 Maple Empire. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MLEditControlInterface;

@interface MLKeyboardToolbar : UIView

- (id)initWithFrame:(CGRect)frame viewsToShow:(NSArray *)viewsToShow;

- (void)attachToolbarToEditControl:(id<MLEditControlInterface>)editControl;
- (void)detachToolbar;

@end
