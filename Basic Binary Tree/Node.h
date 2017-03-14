//
//  Node.h
//  BasicBinaryTree
//
//  Created by whoami on 3/14/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

-(instancetype) initWithValue: (int) value;

-(void) insertElement: (int) value;
-(BOOL) existsElement: (int) value;
-(void) inOrderTraverse;

@property (nonatomic, readonly) int value;

@property (nonatomic, readonly, strong) Node *left;
@property (nonatomic, readonly, strong) Node *right;
@property (nonatomic, readonly, weak) Node *parent;

@end
