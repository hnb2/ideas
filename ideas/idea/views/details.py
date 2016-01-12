from django.views.generic import DetailView
from idea.models import Idea
from idea.service import IdeaService

class DetailView(DetailView):
    model = Idea
    template_name = 'idea/detail.html'

    def get_context_data(self, **kwargs):
        '''
        This is how we can add extra data to the context when using
        a generic view. We are just adding a flag to check whether
        the user already voted for the idea or not.
        '''
        context = super(DetailView, self).get_context_data(**kwargs)

        #Cannot vote if not logged in
        has_not_voted = False

        #Checking if the user already voted
        if self.request.user.id:
            number_of_votes = IdeaService.get_number_of_votes(
                self.request.user.id,
                self.kwargs['pk']
            )

            has_not_voted = (number_of_votes == 0)

        context['has_not_voted'] = has_not_voted
        return context
