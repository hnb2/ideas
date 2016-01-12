from django.db import models
from django.contrib.auth.models import User

class Category(models.Model):
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=255)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = 'Categories'

class Idea(models.Model):
    title = models.CharField(max_length=100)
    created_date = models.DateTimeField()
    updated_date = models.DateTimeField(null=True)
    description = models.TextField()
    excerpt = models.CharField(max_length=200)
    category = models.ForeignKey(Category)
    user = models.ForeignKey(User)
    votes = models.IntegerField()

class UserIdeaVote(models.Model):
    '''
    Relationship between a user and an idea to represent a vote.
    '''
    idea = models.ForeignKey(Idea)
    user = models.ForeignKey(User)
    #TODO: Seems like there is no 'smaller' field to hold -1 or 1
    vote = models.IntegerField()

    class Meta:
        '''
        This is the django way of using multiple column
        primary key. That way we ensure that there is only
        one vote per user and per idea.
        '''
        unique_together = (('idea', 'user'),)
