from django.views.generic import ListView
from idea.models import Category
from idea.service import IdeaService

class ExploreView(ListView):
    '''
    Display the last 8 categories (in order to do 2 rows of 4 grids)
    '''
    template_name = 'idea/explore.html'
    context_object_name = 'latest_categories'

    def get_queryset(self):
        return IdeaService.get_categories(8)
