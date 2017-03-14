//
//  Tree.h
//  BasicBinaryTree
//
//  Created by whoami on 3/14/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Tree : NSObject

@property (nonatomic, readonly) Node *root;

-(void) insertElement: (int) value;
-(BOOL) existsElement: (int) value;
-(void) inOrderTraverse;

@end
