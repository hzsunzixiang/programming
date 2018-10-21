#!/usr/bin/env python
# -*- coding:UTF-8
def compose_greet_func(name):
    def get_message():
        return "Hello there "+name+"!"

    return get_message

print(compose_greet_func("John")())
greet = compose_greet_func("John")
print(greet())

# Outputs: Hello there John!
