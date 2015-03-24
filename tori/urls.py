from django.conf.urls import patterns, include, url
from django.contrib import admin

from tori.home import views as home
from tori.ipa import views as ipa

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'tori.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),

    url(r'^$', ipa.ipa, name='ipa'),
    url(r'^list/$', ipa._list, name='ipa-list'),
    url(r'^list/vowels$', ipa.list_vowels, name='ipa-list-vowels'),
    url(r'^list/consonants$', ipa.list_consonants, name='ipa-list-consonants'),
)
