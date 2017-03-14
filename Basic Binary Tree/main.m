//
//  main.m
//  BasicBinaryTree
//
//  Created by whoami on 3/14/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Tree *tree = [[Tree alloc] init];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 100; ++i) {
      [array addObject: [[NSNumber alloc] initWithInt: arc4random() % 100 + 1]];
    }
    
    for (id elem in array) {
      printf("%d ", [elem intValue]);
      [tree insertElement: [elem intValue]];
    }
    printf("\n");
    
    [tree inOrderTraverse];
  }
  return 0;
}
