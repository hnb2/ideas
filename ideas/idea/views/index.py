from django.views.generic import ListView
from idea.service import IdeaService

class IndexView(ListView):
    '''
    Display the last 8 created ideas (in order to do 2 rows of 4 grids)
    '''
    template_name = 'idea/index.html'
    context_object_name = 'latest_ideas'

    def get_queryset(self):
        '''
        Return a dictionnary of fields, it will not be objects.
        '''
        return IdeaService.get_latest_ideas(8)
