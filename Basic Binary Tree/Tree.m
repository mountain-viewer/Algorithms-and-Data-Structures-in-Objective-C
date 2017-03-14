//
//  Tree.m
//  BasicBinaryTree
//
//  Created by whoami on 3/14/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "Tree.h"

@implementation Tree

-(void) insertElement:(int)value {
  if (_root == nil) {
    _root = [[Node alloc] initWithValue: value];
    return;
  }
  
  [_root insertElement: value];
}

-(BOOL) existsElement:(int)value {
  if (_root == nil) {
    return NO;
  }
  
  return [_root existsElement: value];
}

-(void) inOrderTraverse {
  if (_root == nil) {
    return;
  }
  
  [_root inOrderTraverse];
  printf("\n");
}

@end
