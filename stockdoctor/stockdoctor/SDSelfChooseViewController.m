//
//  SDSelfChooseViewController.m
//  stockdoctor
//
//  Created by zhang kai on 3/5/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "SDSelfChooseViewController.h"

@interface SDSelfChooseViewController ()

@end

@implementation SDSelfChooseViewController

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
    titleLabel.text = @"自选股诊断";
    
    UIButton *editButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48.5, 30.5)];
    [editButton setBackgroundImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editStock) forControlEvents:UIControlEventTouchUpInside];
    [editButton setTitle:[NSString stringWithFormat:@"编辑"] forState:UIControlStateNormal];
    [editButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [editButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
    UIBarButtonItem * leftbarButton = [[UIBarButtonItem alloc] initWithCustomView:editButton];
    [self navigationItem].leftBarButtonItem = leftbarButton;
    [editButton release];
    [leftbarButton release];
    
    UIButton *addStockButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 66.5, 30.5)];
    [addStockButton setBackgroundImage:[UIImage imageNamed:@"addstock"] forState:UIControlStateNormal];
    [addStockButton addTarget:self action:@selector(addStock) forControlEvents:UIControlEventTouchUpInside];
    [addStockButton setTitle:[NSString stringWithFormat:@"添加股票"] forState:UIControlStateNormal];
    [addStockButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [addStockButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
    UIBarButtonItem * rightbarButton = [[UIBarButtonItem alloc] initWithCustomView:addStockButton];
    [self navigationItem].rightBarButtonItem = rightbarButton;
    [addStockButton release];
    [rightbarButton release];

}
-(void)editStock
{
    
}
-(void)addStock
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
