//
//  Heap.h
//  Sorter
//
//  Created by whoami on 2/27/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Heap : NSObject {
  NSMutableArray *_tree;
}

- (void) pushElement: (id) elem;
- (id) extractMinimum;
- (void) setTree: (NSMutableArray *) array;
- (NSMutableArray *) tree;

@end
