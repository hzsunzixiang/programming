from django.conf.urls.defaults import *
from django.conf import settings

urlpatterns = patterns('',
     (r'^cannongraph/$', 'webapps.cannon.draw.draw'),
     (r'^(.*.png)/$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),)
