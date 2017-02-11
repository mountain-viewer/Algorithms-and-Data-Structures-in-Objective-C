//
//  Query.h
//  Algorithms
//
//  Created by whoami on 2/11/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#ifndef Query_h
#define Query_h

typedef struct {
  int left;
  int right;
} Query;

void initQuery(Query *query, int left, int right);

#endif /* Query_h */
