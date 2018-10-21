#!/usr/bin/env python3
# -*- coding:UTF-8


if __name__ == '__main__':
    numbers = [2, 1, 3, 4, 7]
    more_numbers = [*numbers, 11, 18]
    more_numbers1 = [numbers, 11, 18]
    print(more_numbers)
    print(*more_numbers)
    print(*more_numbers, sep=', ')
    print(*more_numbers1, sep=', ')
#    2, 1, 3, 4, 7, 11, 18

