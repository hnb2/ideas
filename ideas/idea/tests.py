from django.test import TestCase
from django.contrib.auth.models import User
from django.utils import timezone
from idea.models import Idea, UserIdeaVote, Category
from idea.service import IdeaService

class ServiceTestCase(TestCase):
    '''
    Test case for the class IdeaService
    '''

    def setUp(self):
        '''
        Create dummy data to play with in the unit tests
        '''
        user = User.objects.create(username='Mr test')

        category_a = Category.objects.create(title='Category A')
        category_b = Category.objects.create(title='Category B')
        category_c = Category.objects.create(title='Category C')

        idea_a = Idea.objects.create(
            title='Idea A',
            user=user,
            category=category_a,
            votes=1,
            created_date=timezone.now()
        )

        idea_b = Idea.objects.create(
            title='Idea B',
            user=user,
            category=category_a,
            votes=0,
            created_date=timezone.now()
        )

        UserIdeaVote.objects.create(idea=idea_a, user=user, vote=1)

        # Variables accessible in this test case:
        self.user = user
        self.idea = idea_a
        self.category = category_a

    def test_get_safe_limit(self):
        '''
        Test the method get_safe_limit
        '''

        # Valid limit
        limit = IdeaService.get_safe_limit(8)
        self.assertEqual(limit, 8)

        # Negative limit
        limit = IdeaService.get_safe_limit(-1)
        self.assertEqual(limit, IdeaService.LIMIT)

        # Limit above max
        limit = IdeaService.get_safe_limit(IdeaService.LIMIT + 1)
        self.assertEqual(limit, IdeaService.LIMIT)

        # None
        limit = IdeaService.get_safe_limit(None)
        self.assertEqual(limit, IdeaService.LIMIT)

        # Parsable string
        limit = IdeaService.get_safe_limit('8')
        self.assertEqual(limit, 8)

        # Un-parsable string
        limit = IdeaService.get_safe_limit('qwerty')
        self.assertEqual(limit, IdeaService.LIMIT)

    def test_get_number_of_votes(self):
        '''
        Testing the method get_number_of_votes
        '''

        # Exising idea and user
        number_of_votes = IdeaService.get_number_of_votes(
            self.user.id,
            self.idea.id
        )
        self.assertEqual(number_of_votes, 1)

        # User does not exist
        number_of_votes = IdeaService.get_number_of_votes(0, self.idea.id)
        self.assertEqual(number_of_votes, 0)

        # Idea does not exist
        number_of_votes = IdeaService.get_number_of_votes(self.user.id, 0)
        self.assertEqual(number_of_votes, 0)

        # Both idea and user do not exist
        number_of_votes = IdeaService.get_number_of_votes(0, 0)
        self.assertEqual(number_of_votes, 0)

        # Using None
        number_of_votes = IdeaService.get_number_of_votes(None, None)
        self.assertEqual(number_of_votes, 0)

    def test_get_categories(self):
        '''
        Testing the method get_categories
        '''

        # Retrieving one category
        categories = IdeaService.get_categories(1)
        self.assertEqual(len(categories), 1)

        # Retrieving all the categories
        categories = IdeaService.get_categories(10)
        self.assertEqual(len(categories), 3)

        # Using None
        categories = IdeaService.get_categories(None)
        self.assertEqual(len(categories), 3)

    def test_get_ideas_by_category(self):
        '''
        Testing the method get_ideas_by_category
        '''

        # Existing category
        category_a_ideas = IdeaService.get_ideas_by_category(
            self.category.id
        )
        self.assertEqual(len(category_a_ideas), 2)

        # Make sure it contains only the desired fields
        idea = category_a_ideas[0]
        self.assertIn('id', idea)
        self.assertIn('title', idea)
        self.assertIn('user__first_name', idea)
        self.assertIn('created_date', idea)
        self.assertIn('excerpt', idea)
        self.assertIn('votes', idea)

        # Category without idea
        category_a_ideas = IdeaService.get_ideas_by_category(2)
        self.assertEqual(len(category_a_ideas), 0)

        # Category does not exist
        category_a_ideas = IdeaService.get_ideas_by_category(999)
        self.assertEqual(len(category_a_ideas), 0)

        # Using none
        category_a_ideas = IdeaService.get_ideas_by_category(None)
        self.assertEqual(len(category_a_ideas), 0)

    def test_get_latest_ideas(self):
        '''
        Testing the method get_latest_ideas
        '''

        # Retrieving all the ideas
        ideas = IdeaService.get_latest_ideas(10)
        self.assertEqual(len(ideas), 2)

        # Make sure it contains only the desired fields
        idea = ideas[0]
        self.assertIn('id', idea)
        self.assertIn('title', idea)
        self.assertIn('user__first_name', idea)
        self.assertIn('created_date', idea)
        self.assertIn('excerpt', idea)
        self.assertIn('votes', idea)

        # Make sure it is sorted by created date DESC
        self.assertGreater(
            ideas[0]['created_date'],
            ideas[1]['created_date']
        )

        # Using None
        ideas = IdeaService.get_latest_ideas(None)
        self.assertEqual(len(ideas), 2)
