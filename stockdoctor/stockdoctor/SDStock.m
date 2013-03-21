//
//  SDStock.m
//  stockdoctor
//
//  Created by zhang kai on 3/21/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "SDStock.h"

@implementation SDStock
@synthesize stockCode = _stockCode,stockName = _stockName;

-(void)dealloc
{
    [_stockCode release];
    [_stockName release];
    [super dealloc];
}
-(id)initWithStock:(NSString *)sCode stockN:(NSString *)sName
{
    if (self = [super init]) {
        
        self.stockCode = sCode;
        self.stockName = sName;
    }
    return self;
}
@end
