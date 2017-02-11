//
//  SegmentTree.m
//  Algorithms
//
//  Created by whoami on 2/10/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "SegmentTree.h"

@implementation SegmentTree

- (void) setData: (NSArray *) data {
  _data = data;
}

- (void) buildTreeHelp: (int) vertex
            leftBorder: (int) leftBorder
           rightBorder: (int) rightBorder {
  
  if (leftBorder == rightBorder) {
    _tree[vertex] = _data[leftBorder];
    return;
  }
  
  int middle = (leftBorder + rightBorder) / 2;
  
  [self buildTreeHelp: vertex * 2
           leftBorder: leftBorder
          rightBorder: middle];
  
  [self buildTreeHelp: vertex * 2 + 1
           leftBorder: middle + 1
          rightBorder: rightBorder];
  
  _tree[vertex] = [NSNumber numberWithInt: [_tree[vertex * 2] intValue] + [_tree[vertex * 2 + 1] intValue]];
}

- (int64_t) getSegmentSumHelp: (int) vertex
                   leftBorder: (int) leftBorder
                  rightBorder: (int) rightBorder
                        query: (Query) query {
  
  if (leftBorder == query.left && query.right == rightBorder) {
       return (int64_t)[_tree[vertex] longLongValue];
  }
  
  int middle = (leftBorder + rightBorder) / 2;
  
  if (leftBorder <= query.left && query.right <= middle) {
    return [self getSegmentSumHelp: vertex * 2
                        leftBorder: leftBorder
                       rightBorder: middle
                             query: query];
  } else if (middle + 1 <= query.left && query.right <= rightBorder) {
    return [self getSegmentSumHelp: vertex * 2 + 1
                        leftBorder: middle + 1
                       rightBorder: rightBorder
                             query: query];
  } else if (leftBorder <= query.left && query.right <= rightBorder) {
    Query leftQuery;
    
    initQuery(&leftQuery, query.left, middle);
    int64_t leftResult = [self getSegmentSumHelp: vertex * 2
                                      leftBorder: leftBorder
                                     rightBorder: middle
                                           query: leftQuery];
    
    Query rightQuery;
    
    initQuery(&rightQuery, middle + 1, query.right);
    int64_t rightResult = [self getSegmentSumHelp: vertex * 2 + 1
                                       leftBorder: middle + 1
                                      rightBorder: rightBorder
                                            query: rightQuery];
    
    return leftResult + rightResult;
  }
  
  return 0;
}

- (void) buildTree {
  _tree = [[NSMutableArray alloc] init];
  
  for (int i = 0; i < 4 * [_data count]; ++i) {
    [_tree addObject: @0];
  }
  
  [self buildTreeHelp: 1
           leftBorder: 0
          rightBorder: (int)[_data count] - 1];
}

- (int64_t) getSegmentSum: (Query)query {
  return [self getSegmentSumHelp: 1
                      leftBorder: 0
                     rightBorder: (int)[_data count] - 1
                           query: query];
}

@end
