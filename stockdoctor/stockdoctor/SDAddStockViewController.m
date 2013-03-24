//
//  SDAddStockViewController.m
//  stockdoctor
//
//  Created by zhang kai on 3/9/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "SDAddStockViewController.h"
#import "RessourceManager.h"
#import "SDStock.h"
#import "SDStockDetailViewController.h"

@interface SDAddStockViewController ()

@end

@implementation SDAddStockViewController

-(void)dealloc
{
    [tableview release];
    [super dealloc];
}
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
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(7.25, 5, 305.5, 45)];
    background.image = [UIImage imageNamed:@"search"];
    background.userInteractionEnabled = YES;
    [self.view addSubview:background];
    [background release];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(30 + 7.25, 5, 305.5 - 30, 45)];
    [textField setPlaceholder:@"请输入股票代码\\全拼首\\字母"];
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.delegate = self;
    [textField setTextColor:[UIColor whiteColor]];
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [textField becomeFirstResponder];
    [self.view addSubview:textField];
    [textField release];
    
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, 320, 460 - 50)];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.separatorColor = [UIColor lightGrayColor];
    tableview.dataSource = self;
    tableview.delegate = self;
    [self.view addSubview:tableview];    
}
-(void)goBack
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}
#pragma UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self feathStockData:newString];
    return YES;
}
-(void)feathStockData:(NSString *)stockS
{
    RessourceManager *ressourceManager = [RessourceManager sharedResources];
    [ressourceManager featchAllStocks:stockS];
    [tableview reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    RessourceManager *ressourceManager = [RessourceManager sharedResources];
    return [ressourceManager.stocksArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]autorelease];
    }
    RessourceManager *ressourceManager = [RessourceManager sharedResources];
    SDStock *stock = [ressourceManager.stocksArray objectAtIndex:indexPath.row];
    cell.textLabel.text = stock.stockName;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SDStockDetailViewController *stockDetailViewController = [[SDStockDetailViewController alloc]initWithNavBar];
    [self.navigationController pushViewController:stockDetailViewController animated:YES];
    [stockDetailViewController release];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
