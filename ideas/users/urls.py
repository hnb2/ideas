from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^profile/$', views.ProfileView.as_view(), name='profile'),
    url(r'^login/$', views.LoginView.as_view(), name='login'),
]
