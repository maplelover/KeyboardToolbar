//
//  ViewController.m
//  KeyboardToolbar
//
//  Created by zhoujr on 3/18/14.
//  Copyright (c) 2014 Maple Empire. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Core/MLEditControlInterface.h"
#import "Core/MLKeyboardToolbar.h"
#import "MLToolbarButton.h"

@interface ViewController () <MLEditControlInterface>

@property (nonatomic, retain) UITextView *textView;
@property (nonatomic, retain) MLKeyboardToolbar *keyboardToolbar;

@end

@implementation ViewController

- (void)dealloc
{
    [_keyboardToolbar detachToolbar];
    [_keyboardToolbar release];
    [_textView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Keyboard Toolbar";
    
    CGRect containerBounds = CGRectInset(self.view.bounds, 20, 20);
    
    CGRect titleFrame = containerBounds;
    titleFrame.size.height = 40;
    UILabel *titleLabel = [[[UILabel alloc] initWithFrame:titleFrame] autorelease];
    titleLabel.text = self.title;
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.layer.shadowColor = [UIColor redColor].CGColor;
    titleLabel.layer.shadowRadius = 10;
    titleLabel.layer.shadowOpacity = 0.8;
    titleLabel.clipsToBounds = NO;
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleLabel];
    
    CGRect textFrame = containerBounds;
    textFrame.origin.y = CGRectGetMaxY(titleFrame) + 8;
    textFrame.size.height -= textFrame.origin.y;
    _textView = [[UITextView alloc] initWithFrame:textFrame];
    _textView.layer.borderWidth = 1;
    _textView.layer.borderColor = [UIColor grayColor].CGColor;
    _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_textView];
    
    UIImageView *imgView1 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 34, 34)] autorelease];
    imgView1.contentMode = UIViewContentModeCenter;
    imgView1.image = [UIImage imageNamed:@"image.png"];
    
    UIImageView *imgView2 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 34, 34)] autorelease];
    imgView2.contentMode = UIViewContentModeCenter;
    imgView2.image = [UIImage imageNamed:@"image.png"];
    
    UIImageView *imgView3 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 34, 34)] autorelease];
    imgView3.contentMode = UIViewContentModeCenter;
    imgView3.image = [UIImage imageNamed:@"image.png"];
    
    UIImageView *imgView4 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 34, 34)] autorelease];
    imgView4.contentMode = UIViewContentModeCenter;
    imgView4.image = [UIImage imageNamed:@"image.png"];
    
    MLToolbarButton *btn1 = [[[MLToolbarButton alloc] initWithFrame:CGRectMake(0, 0, 60, 34)] autorelease];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    [btn1 setTitle:@"www." forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    MLToolbarButton *btn2 = [[[MLToolbarButton alloc] initWithFrame:CGRectMake(0, 0, 60, 34)] autorelease];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    [btn2 setTitle:@"wap." forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    MLToolbarButton *btn3 = [[[MLToolbarButton alloc] initWithFrame:CGRectMake(0, 0, 60, 34)] autorelease];
    [btn3 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    [btn3 setTitle:@".com" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    MLToolbarButton *btn4 = [[[MLToolbarButton alloc] initWithFrame:CGRectMake(0, 0, 160, 34)] autorelease];
    [btn4 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    [btn4 setTitle:@"I am long long text......" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    MLToolbarButton *btn5 = [[[MLToolbarButton alloc] initWithFrame:CGRectMake(0, 0, 180, 34)] autorelease];
    [btn5 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    [btn5 setTitle:@"http://www.tinchou.com" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    MLToolbarButton *btn6 = [[[MLToolbarButton alloc] initWithFrame:CGRectMake(0, 0, 180, 34)] autorelease];
    [btn6 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    [btn6 setTitle:@"http://github.com" forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    ////////////////////////
    NSArray *viewsToShow = @[imgView1, imgView2, btn1, btn2, btn3, btn4, btn5, btn6, imgView3, imgView4];
    ////////////////////////
    
    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    CGRect toolbarFrame =  rootViewController.view.bounds;
    toolbarFrame.size.height = 44;
    _keyboardToolbar = [[MLKeyboardToolbar alloc] initWithFrame:toolbarFrame viewsToShow:viewsToShow];
    _keyboardToolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [_keyboardToolbar attachToolbarToEditControl:self];
}

- (void)buttonClicked:(UIButton *)sender
{
    [self.textView insertText:sender.titleLabel.text];
}

#pragma mark - MLEditControlInterface
- (UIView *)inputAccessoryView
{
    return self.textView;
}

- (void)setInputAccessoryView:(UIView *)inputAccessoryView
{
    self.textView.inputAccessoryView = inputAccessoryView;
}

@end
