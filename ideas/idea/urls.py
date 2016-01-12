from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^explore/$', views.ExploreView.as_view(), name='explore'),
    url(r'^(?P<category_id>[0-9]+)/$', views.IdeasView.as_view(), name='ideas'),
    url(r'^idea/(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),
    url(r'^add/$', views.IdeaFormView.as_view(), name='add'),
    url(r'^edit/(?P<idea_id>[0-9]+)$', views.IdeaFormView.as_view(), name='edit'),
    url(r'^upvote/$', views.IdeaUpvoteView.as_view(), name='upvote'),
    url(r'^downvote/$', views.IdeaDownvoteView.as_view(), name='downvote'),
]
