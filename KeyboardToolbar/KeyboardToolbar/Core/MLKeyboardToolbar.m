//
//  MLKeyboardToolbar.m
//  KeyboardToolbar
//
//  Created by zhoujr on 3/18/14.
//  Copyright (c) 2014 Maple Empire. All rights reserved.
//

#import "MLKeyboardToolbar.h"
#import "MLEditControlInterface.h"

@interface MLKeyboardToolbar()

@property (nonatomic, retain) NSArray *viewsToShow;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIView *toolbarView;
@property (nonatomic, retain) CALayer *topBorder;
@property (nonatomic, assign) id<MLEditControlInterface> editControl;

@end

@implementation MLKeyboardToolbar

- (id)initWithFrame:(CGRect)frame viewsToShow:(NSArray *)viewsToShow
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.viewsToShow = viewsToShow;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:[self inputAccessoryView]];
    }
    return self;
}

- (void)dealloc
{
    _editControl = nil;
    [_topBorder release];
    [_viewsToShow release];
    [_scrollView release];
    [_toolbarView release];
    [super dealloc];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = _toolbarView.bounds;
    frame.size.height = 0.5f;
    self.topBorder.frame = frame;
}

- (UIView *)inputAccessoryView
{
    _toolbarView = [[UIView alloc] initWithFrame:self.bounds];
    _toolbarView.backgroundColor = [UIColor colorWithWhite:0.973 alpha:1.0];
    _toolbarView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    _topBorder = [[CALayer layer] retain];
    _topBorder.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, 0.5f);
    _topBorder.backgroundColor = [UIColor colorWithWhite:0.678 alpha:1.0].CGColor;
    
    [_toolbarView.layer addSublayer:_topBorder];
    [_toolbarView addSubview:[self fakeToolbar]];
    
    return _toolbarView;
}

- (UIScrollView *)fakeToolbar
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentInset = UIEdgeInsetsMake(6.0f, 7.0f, 7.0f, 6.0f);
    
    NSUInteger index = 0;
    NSUInteger originX = 0;
    
    CGRect originFrame;
    
    for (UIView *view in self.viewsToShow)
    {
        originFrame = CGRectMake(originX, 0, view.frame.size.width, view.frame.size.height);
        view.frame = originFrame;
        
        [_scrollView addSubview:view];
        
        originX = originX + view.bounds.size.width + 8;
        index++;
    }
    
    CGSize contentSize = _scrollView.contentSize;
    contentSize.width = originX - 8;
    _scrollView.contentSize = contentSize;
    
    return _scrollView;
}

- (void)attachToolbarToEditControl:(id<MLEditControlInterface>)editControl
{
    self.editControl = editControl;
    [self.editControl setInputAccessoryView:self];
}

- (void)detachToolbar
{
    [self.editControl setInputAccessoryView:nil];
    self.editControl = nil;
}

@end
