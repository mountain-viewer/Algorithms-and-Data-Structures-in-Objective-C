//
//  Heap.m
//  Sorter
//
//  Created by whoami on 2/27/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "Heap.h"

@implementation Heap

- (void) siftDown {
  int current_idx = 0;
  
  while (2 * current_idx < [_tree count]) {
    int left_idx = 2 * current_idx, right_idx = 2 * current_idx + 1;
    id min = [_tree objectAtIndex: left_idx];
    int min_idx = left_idx;
    
    if (right_idx < [_tree count] &&
        [_tree objectAtIndex: right_idx] < min) {
      min_idx = right_idx;
      min = [_tree objectAtIndex: right_idx];
    }
    
    if ([_tree objectAtIndex: current_idx] > min) {
      [_tree exchangeObjectAtIndex: current_idx withObjectAtIndex: min_idx];
      current_idx = min_idx;
    } else {
      break;
    }
  }
}

- (void) setTree:(NSMutableArray *)array {
  _tree = array;
}

- (NSMutableArray *) tree {
  return _tree;
}

- (void) siftUp {
  int idx = (int) [_tree count] - 1;
  
  while (idx > 0 && [_tree objectAtIndex: idx / 2] > [_tree objectAtIndex: idx]) {
    [_tree exchangeObjectAtIndex: idx / 2 withObjectAtIndex: idx];
    idx /= 2;
  }
}

- (void) pushElement: (id)elem {
  [_tree addObject: elem];
  [self siftUp];
}

- (id) extractMinimum {
  id min = [_tree objectAtIndex: 0];
  
  [_tree replaceObjectAtIndex: 0 withObject: [_tree objectAtIndex: [_tree count] - 1]];
  [_tree removeObjectAtIndex: [_tree count] - 1];
  
  [self siftDown];
  
  return min;
}

@end
