#!/usr/bin/env python
# -*- coding:UTF-8


class hithere():

    def french(self):
        print 'bonjour'

    def english(self):
        print 'hello'

    def german(self):
        print 'hallo'

    def czech(self):
        print 'ahoj'

    def noidea(self):
        print 'unknown language'


def dispatch(language):
    try:
        getattr(hithere(),language)()
    except:
        getattr(hithere(),'noidea')()
        # note, do better error handling than this

dispatch('french')
dispatch('english')
dispatch('german')
dispatch('czech')
dispatch('spanish')
