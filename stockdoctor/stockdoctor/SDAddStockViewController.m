//
//  SDAddStockViewController.m
//  stockdoctor
//
//  Created by zhang kai on 3/9/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "SDAddStockViewController.h"

@interface SDAddStockViewController ()

@end

@implementation SDAddStockViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 30.5)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:[NSString stringWithFormat:@"返回"] forState:UIControlStateNormal];
    [backButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [backButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
    UIBarButtonItem * leftbarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self navigationItem].leftBarButtonItem = leftbarButton;
    [backButton release];
    [leftbarButton release];
}
-(void)goBack
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    titleLabel.text = @"添加股票";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
