//
//  DBManager.h
//  AppDelegateMethodsCheck
//
//  Created by Vaibhav Jain on 29/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject
{
    NSString *databasePath;
}

+(DBManager*)getSharedInstance;
-(BOOL)createDB;
-(BOOL) saveData:(NSString*)registerNumber name:(NSString*)name
      department:(NSString*)department year:(NSString*)year;
-(NSArray*) findByRegisterNumber:(NSString*)registerNumber;
-(int) countNumberOfRows;



@end
