//
//  SDStock.h
//  stockdoctor
//
//  Created by zhang kai on 3/21/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDStock : NSObject

@property(nonatomic,retain) NSString *stockCode;
@property(nonatomic,retain) NSString *stockName;

-(id)initWithStock:(NSString *)sCode stockN:(NSString *)sName;
@end
