#!/usr/bin/env python
#
# Copyright 2009 Facebook
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
from setuptools import setup, find_packages

setup(
    name='tornado',
    version='1.6',
    license='BSD',
    author='szx',
    author_email='hello@world.com',
    url='http://www.hello.com',
    long_description="README.txt",
    #packages = ["lib","lib.rpc","lib.thrift"],
    packages=find_packages(),
    #scripts=['NBSAgent/lib/NBSAgent.py'],
    include_package_data=True,
    zip_safe=False,
    #scripts = ['helloworld.py'],
    #package_data={
    #    "" : ["images/*.gif"]
    #},
    #data_files=[('images', ['images/hello.gif'])],
    #description="Hello World testing setuptools",
)

