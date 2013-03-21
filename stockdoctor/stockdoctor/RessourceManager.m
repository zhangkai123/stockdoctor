

#import "RessourceManager.h"
#import "SDStock.h"

@implementation RessourceManager
@synthesize databasePath;
@synthesize stocksArray = _stocksArray;

static RessourceManager* instance = NULL;

+ (RessourceManager*)sharedResources {
	@synchronized(self) {
		if(instance == NULL)
			instance = [[RessourceManager alloc] initDatabase:@"QQStock.db"];
	}
	return instance;
}

- (id)initDatabase:(NSString *)databaseName {
	
	NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir = [documentPaths objectAtIndex:0];
	self.databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
	
	// check if the db is already installed
	NSFileManager *manager = [NSFileManager defaultManager];
	
	if(![manager fileExistsAtPath:self.databasePath]) {
		printf("No database\n");
		NSString *appPath = [[NSBundle mainBundle] pathForResource:databaseName ofType:nil];
		[manager copyItemAtPath:appPath toPath:databasePath error:NULL];
	}
	
	return self;
}

-(void)featchAllStocks:(NSString *)keyStr
{
	sqlite3 *database;
    if (_stocksArray != nil) {
        [_stocksArray release];
        _stocksArray = nil;
    }
    _stocksArray = [[NSMutableArray alloc] init];
	
	if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
		
        sqlite3_stmt *featchStockCodeStatement;
        const char *featchStockCode = (const char *)[[NSString stringWithFormat:@"SELECT * FROM key_table where key='%@'",keyStr] UTF8String];
        sqlite3_prepare_v2(database, featchStockCode, -1, &featchStockCodeStatement, NULL);
		sqlite3_reset(featchStockCodeStatement);
        
		while(sqlite3_step(featchStockCodeStatement) == SQLITE_ROW) {
            NSString *stockString = [NSString stringWithUTF8String:(char *)sqlite3_column_text(featchStockCodeStatement, 1)];
            NSArray *stockNames = [stockString componentsSeparatedByString:@","];
            
            for (NSString *stockName in stockNames) {
             
                sqlite3_stmt *featchStockStatement;
                const char *featchStocks = (const char *)[[NSString stringWithFormat:@"select * from values_table where stockCode='%@'",stockName] UTF8String];
                sqlite3_prepare_v2(database, featchStocks, -1, &featchStockStatement, NULL);
                sqlite3_reset(featchStockStatement);
                while (sqlite3_step(featchStockStatement) == SQLITE_ROW) {
                    NSString *stockName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(featchStockStatement, 1)];
                    NSString *stockCode = [NSString stringWithUTF8String:(char *)sqlite3_column_text(featchStockStatement, 0)];
                    SDStock *stock = [[SDStock alloc]initWithStock:stockCode stockN:stockName];
                    [_stocksArray addObject:stock];
                    [stock release];
                }
            }
		}
	}
	sqlite3_close(database);
}
@end
