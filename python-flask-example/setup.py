#!/usr/bin/env python

from setuptools import setup, find_packages

setup(
    name='flask-example',
    version='0.1.0',
    packages=find_packages(),
    scripts=["app.py"],
    install_requires=['Flask'],
)
