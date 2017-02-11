//
//  SegmentTree.h
//  Algorithms
//
//  Created by whoami on 2/10/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Query.h"


@interface SegmentTree : NSObject {
  NSArray *_data;
  NSMutableArray *_tree;
}

- (void) buildTree;
- (int64_t) getSegmentSum: (Query) query;
- (void) setData: (NSArray *) data;

- (void) buildTreeHelp: (int) vertex
            leftBorder: (int) leftBorder
           rightBorder: (int) rightBorder;

- (int64_t) getSegmentSumHelp: (int) vertex
                   leftBorder: (int) leftBorder
                  rightBorder: (int) rightBorder
                        query: (Query) query;

@end
