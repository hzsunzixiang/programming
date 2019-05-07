#!/usr/bin/env python3
# -*- coding:UTF-8


if __name__ == '__main__':
    def transpose_list(list_of_lists):
        return [
            list(row)
            for row in zip(*list_of_lists)
        ]
    print(transpose_list([[1, 4, 7], [2, 5, 8], [3, 6, 9]]))
#[[1, 2, 3], [4, 5, 6], [7, 8, 9]]

