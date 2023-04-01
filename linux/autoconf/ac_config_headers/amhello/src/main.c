/* Copyright (C) 2006-2014 Free Software Foundation, Inc.
   This program is free software; the Free Software Foundation
   gives unlimited permission to copy, distribute and modify it.  */

#if defined(HAVE_CONFIG_H)
#include <config/bitcoin-config.h>
#endif

#include <stdio.h>

int
main (void)
{
  puts ("Hello World!");
  puts ("This is " PACKAGE_STRING ".");
  return 0;
}
