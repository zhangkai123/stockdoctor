//
//  SDAddStockViewController.h
//  stockdoctor
//
//  Created by zhang kai on 3/9/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDRootViewController.h"

@interface SDAddStockViewController:SDRootViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *tableview;
}
@end
