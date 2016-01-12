from django.views.generic import View
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from idea.models import Idea

class LoginRequiredMixin(View):
    '''
    Source: https://docs.djangoproject.com/en/1.8/topics/class-based-views/intro/
    '''

    @classmethod
    def as_view(cls, **initkwargs):
        view = super(LoginRequiredMixin, cls).as_view(**initkwargs)
        return login_required(view)

class ProfileView(LoginRequiredMixin):

    def get(self, request):
        '''
        Returns the current user and his last 8 ideas.
        '''
        user = request.user
        ideas = Idea.objects.filter(user__id=user.id).order_by('created_date')[:8]

        context = {'user': user, 'ideas': ideas}

        return render(request, 'users/profile.html', context)

class LoginView(View):
    '''
    Plain page which presents the different login options
    '''

    def get(self, request):
        '''
        Renders the login template
        '''
        #Check if there is a next GET parameter to redirect the user
        #after a successful login. Otherwise default on the profile.
        next_param = request.GET.get('next', '/users/profile/')

        context = {'next_param': next_param}

        return render(request, 'users/login.html', context)
