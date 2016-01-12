from django.views.generic import ListView
from idea.service import IdeaService

class IdeasView(ListView):
    template_name = 'idea/ideas.html'
    context_object_name = 'latest_ideas'
    paginate_by = 8

    def get_context_data(self, **kwargs):
        '''
        This is how we can add extra data to the context when using
        a generic view. We are just adding the category id.
        '''
        context = super(IdeasView, self).get_context_data(**kwargs)
        context['category_id'] = self.kwargs['category_id']
        return context

    def get_queryset(self):
        '''
        Return a dictionnary of fields, it will not be objects.
        '''
        return IdeaService.get_ideas_by_category(
            self.kwargs['category_id']
        )
