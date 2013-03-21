//
//  RessourceManager.h
//  Restaurant
//
//  Created by ecco-work on 1/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sqlite3.h>


@interface RessourceManager : NSObject {

	NSString		*databasePath;
}


@property (nonatomic, retain) NSString *databasePath;
@property (nonatomic, retain) NSMutableArray *stocksArray;

- (id)initDatabase:(NSString*)databaseName;
+ (RessourceManager*)sharedResources;

-(void)featchAllStocks:(NSString *)keyStr;

@end
