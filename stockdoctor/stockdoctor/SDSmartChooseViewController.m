//
//  SDSmartChooseViewController.m
//  stockdoctor
//
//  Created by zhang kai on 3/5/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "SDSmartChooseViewController.h"

@interface SDSmartChooseViewController ()

@end

@implementation SDSmartChooseViewController

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
    self.view.backgroundColor = [UIColor blueColor];
    titleLabel.text = @"智能选股";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
