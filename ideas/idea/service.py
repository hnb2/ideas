from idea.models import Category, Idea, UserIdeaVote

class IdeaService:
    '''
    Contains database helpers for the Idea module
    '''

    LIMIT=100

    @classmethod
    def get_safe_limit(cls, limit):
        '''
        This will return a safe limit, based on the limit given in
        parameter. If it is not valid, it will return the safe one
        defined in LIMIT.
        '''
        try:
            int_limit = int(limit)
        except (TypeError, ValueError):
            # TypeError -> None
            # ValueError -> Invalid literal
            return cls.LIMIT

        if int_limit > 0 and int_limit < cls.LIMIT:
            return int_limit
        else:
            return cls.LIMIT

    @classmethod
    def get_number_of_votes(cls, user_id, idea_id):
        '''
        Returns the number of votes for an idea and a user.
        Can only return 0 or 1.
        '''
        return UserIdeaVote.\
            objects.\
            filter(user=user_id).\
            filter(idea_id=idea_id).\
            count()

    @classmethod
    def get_categories(cls, limit):
        '''
        Returns the last categories.
        '''
        return Category.\
            objects.\
            order_by('-id')[:IdeaService.get_safe_limit(limit)]

    @classmethod
    def get_ideas_by_category(cls, category_id):
        '''
        Returns a dictionnary of ideas ordered from the most
        voted idea to the least voted one (voted DESC).
        BE CAREFUL: This is using the all method, this queryset
        has to be sliced before use, or used with a paginator.
        '''
        return Idea.\
            objects.\
            filter(category__id=category_id).\
            order_by('-votes').\
            values(
                'id',
                'title',
                'user__first_name',
                'created_date',
                'votes',
                'excerpt'
            ).\
            all()

    @classmethod
    def get_latest_ideas(cls, limit):
        '''
        Returns the latest created ideas.
        TODO: factorize thos queryset and the one from:
        get_ideas_by_category
        '''
        return Idea.\
            objects.\
            order_by('-created_date').\
            values(
                'id',
                'title',
                'user__first_name',
                'created_date',
                'votes',
                'excerpt'
            )[:limit]
