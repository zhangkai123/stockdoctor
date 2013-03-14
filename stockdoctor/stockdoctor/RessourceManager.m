

#import "RessourceManager.h"
//#import "MyBook.h"

@implementation RessourceManager
@synthesize databasePath;
@synthesize booksArray = _booksArray;

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
	
	// setup our compiled sql statements
	sqlite3 *database;
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		printf("SQLite is ok\n");
		sqlite3_stmt *compiledStatement;
				
		const char *featchBooks = "select * from Books" ;
		sqlite3_prepare_v2(database, featchBooks, -1, &compiledStatement, NULL);
		getAllBooks = compiledStatement;	
	}
	
	sqlite3_close(database);
	return self;	
}

//-(void)featchAllBooks
//{
//	sqlite3 *database;
//    if (_booksArray != nil) {
//        [_booksArray release];
//        _booksArray = nil;
//    }
//    _booksArray = [[NSMutableArray alloc] init];
//	
//	if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
//		
//		sqlite3_reset(getAllBooks);
//		while(sqlite3_step(getAllBooks) == SQLITE_ROW) {
//
//            NSString *thumbImageName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(getAllBooks, 0)];
//            NSString *bookName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(getAllBooks, 1)];
//            NSString *date = [NSString stringWithUTF8String:(char *)sqlite3_column_text(getAllBooks, 2)];
//            NSString *description = [NSString stringWithUTF8String:(char *)sqlite3_column_text(getAllBooks, 3)];
//            
//            MyBook *myBook = [[MyBook alloc]init];
//            myBook.thumbImageName = thumbImageName;
//            myBook.bookName = bookName;
//            myBook.date = date;
//            myBook.description = description;
//            
//            [self.booksArray addObject:myBook];
//            [myBook release];
//		}	
//	}
//	sqlite3_close(database);
//}
//-(void)insertBook:(NSString *)thumbIN bookN:(NSString *)bName d:(NSString *)bookD des:(NSString *)bookDes
//{
//    sqlite3 *database;
//	sqlite3_stmt *compiledStatement;
//	
//	if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK){
//		NSString *insertCommand = [NSString stringWithFormat:@"insert into Books (thumbImageName,bookName,date,description) VALUES('%@','%@','%@','%@')" , thumbIN , bName , bookD,bookDes];
//		const char *insertSqlCommand = [insertCommand UTF8String];
//		if (sqlite3_prepare_v2(database, insertSqlCommand, -1, &compiledStatement, NULL) == SQLITE_OK) {
//			if (sqlite3_step(compiledStatement) == SQLITE_DONE) {
//				compiledStatement = nil;
//				
//			}			
//			printf("ok\n");
//		}
//        
//	}
//	sqlite3_close(database);
//}
@end
