from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from django.utils.html import strip_tags
from users.views import LoginRequiredMixin
from idea.models import Idea
from idea.forms import IdeaForm

class IdeaFormView(LoginRequiredMixin):
    '''
    This view is responsible for both add and edit a view
    '''

    def get(self, request, idea_id=None):
        '''
        Return a form with the category preset in the select if the
        GET parameter category=<id: int> is set. Otherwise it will
        have the default empty value.
        '''
        if idea_id:
            idea = get_object_or_404(Idea, pk=idea_id)

            # Users can only edit their own ideas
            if idea.user.id != request.user.id:
                return HttpResponseRedirect('/ideas/idea/' + str(idea.id))

            title = 'Edit your idea'

            initial={
                'title': idea.title,
                'description': idea.description,
                'excerpt': idea.excerpt,
                'categories': idea.category.id
            }
        else:
            title = 'Create a new idea !'

            initial={'categories': request.GET.get('category', 1)}

        form = IdeaForm(initial=initial)

        return render(
            request,
            'idea/form.html',
            {'form': form, 'title': title}
        )

    def post(self, request, idea_id=None):
        form = IdeaForm(request.POST)

        if not form.is_valid():
            return render(request, 'idea/form.html', {'form': form})

        if idea_id:
            # Update the existing idea with data from the form
            idea = get_object_or_404(Idea, pk=idea_id)
            idea.updated_date = timezone.now()
        else:
            # Create a new idea with data from the form and default values
            idea = Idea(
                created_date=timezone.now(),
                user_id=self.request.user.id,
                votes=0
            )

        idea.title = form.cleaned_data['title']
        idea.description = form.cleaned_data['description']
        idea.category_id = form.cleaned_data['categories'].id

        # Setting the excerpt
        excerpt = form.cleaned_data['excerpt']
        if not excerpt:
            # Max is 200, we remove 3 char for '...'
            MAX = 197

            stripped_description = strip_tags(idea.description)
            stripped_description = stripped_description.replace('&nbsp;', ' ')

            length = len(stripped_description)
            if length > MAX:
                excerpt = stripped_description[:MAX] + '...'
            else:
                excerpt = stripped_description

        idea.excerpt = excerpt

        idea.save()

        return HttpResponseRedirect('/ideas/idea/' + str(idea.id))
