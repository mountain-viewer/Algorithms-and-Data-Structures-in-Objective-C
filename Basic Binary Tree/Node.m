//
//  Node.m
//  BasicBinaryTree
//
//  Created by whoami on 3/14/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "Node.h"

@implementation Node

-(instancetype) initWithValue:(int)value {
  self = [super init];
  
  if (self) {
    _value = value;
  }
  
  return self;
}

-(void) insertElement:(int)value {
  if (_value == value) {
    return;
  }
  
  if (value < _value) {
    if (_left) {
      [_left insertElement: value];
    } else {
      _left = [[Node alloc] initWithValue: value];
    }
  }
  
  if (_value < value) {
    if (_right) {
      [_right insertElement: value];
    } else {
      _right = [[Node alloc] initWithValue: value];
    }
  }
}

-(BOOL) existsElement:(int)value {
  if (_value == value) {
    return YES;
  }
  
  if (value < _value) {
    if (_left) {
      return [_left existsElement: value];
    }
    return NO;
  }
  
  if (_value < value) {
    if (_right) {
      return [_right existsElement: value];
    }
    return NO;
  }
  
  return YES;
}

-(void) inOrderTraverse {
  if (_left) {
    [_left inOrderTraverse];
  }
  
  printf("%d ", _value);
  
  if (_right) {
    [_right inOrderTraverse];
  }
}

@end
