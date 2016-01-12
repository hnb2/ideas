from django.views.generic import View
from django.http import JsonResponse
from idea.models import UserIdeaVote
from idea.forms import VoteForm
import json

class IdeaVoteView(View):
    '''
    This will be the base class for the upvote and downvote API.
    It will trigger 4 SQL requests:
        * IdeaIdField
            * select idea (does not exist)
            * select ideaUserVote (did the user voted already)
        * IdeaVoteView
            * update idea (change vote counter)
            * insert ideaUserVote (add vote constraint)
    '''

    incr = 0

    def post(self, request):
        data = json.loads(request.body)
        form = VoteForm(request.user, data)

        if not form.is_valid():
            return JsonResponse({'errors': form.errors.as_json()})

        # Save the idea, now that is is valid
        idea = form.cleaned_data['idea_id']
        idea.votes += self.incr
        idea.save()

        # Adding a vote user/idea constraint
        userIdeaVote = UserIdeaVote(
            user_id=request.user.id,
            idea_id=idea.id,
            vote=idea.votes
        )
        userIdeaVote.save()

        return JsonResponse({'votes': idea.votes})

class IdeaUpvoteView(IdeaVoteView):
    incr = 1

class IdeaDownvoteView(IdeaVoteView):
    incr = -1
