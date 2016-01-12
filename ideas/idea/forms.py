from django import forms
from django.utils.safestring import mark_safe
from django.utils.html import strip_tags
from django.template.loader import render_to_string
from idea.models import Idea, UserIdeaVote, Category
from idea.service import IdeaService

class RichTextEditorWidget(forms.Widget):
    '''
    This is a widget used to wrap Quill Rich Text Editor
    TODO: Should use the Media inner class to load the JS
    https://docs.djangoproject.com/en/1.9/topics/forms/media/
    '''
    template_name = 'rich_text_editor_widget.html'

    def render(self, name, value, attrs=None):
        '''
        TODO
        '''
        # This prevents from displaying 'None' in the field
        if value is None:
            value = ''

        context = {
            'name': name,
            'value': value
        }

        return mark_safe(render_to_string(self.template_name, context))

class DescriptionField(forms.CharField):
    '''
    This is basically an 'upgraded' Charfield. It is used for a description
    field which uses a rich text editor in javascript.
    '''

    def __init__(self, *args, **kwargs):
        '''
        Add custom fields:
            max_char_length which define the maximum of
            characters after it has been stripped of all tags.
        '''
        self.max_char_length = kwargs['max_char_length']
        kwargs.pop('max_char_length', None)

        super(DescriptionField, self).__init__(*args, **kwargs)

    def validate(self, value):
        '''
        Instead of validating the number of characters of the 'raw'
        value, it will strip out all the HTML tags in order to check
        the length of the content itself.
        After the call to validate, the max_length will be checked.
        '''
        super(DescriptionField, self).validate(value)

        # Testing the characters stripped of any tags
        stripped_description = strip_tags(value)
        stripped_description = stripped_description.replace('&nbsp;', ' ')
        nb_char = len(stripped_description)

        if nb_char > self.max_char_length:
            error_msg =\
            'There is a limit of %d characters (it contains %d).' %(
                self.max_char_length,
                nb_char
            )
            raise forms.ValidationError(error_msg);


class IdeaForm(forms.Form):
    '''
    Form to create a new idea.
    '''
    title = forms.CharField(
        label='Title',
        max_length=100
    )
    excerpt = forms.CharField(
        label='Excerpt',
        required=False,
        max_length=200
    )
    description = DescriptionField(
        label='Description',
        max_char_length=1000,
        max_length=5000,
        widget=RichTextEditorWidget
    )
    categories = forms.ModelChoiceField(
        queryset=Category.objects.all(),
        empty_label=None
    )

class IdeaIdField(forms.Field):

    def __init__(self, user, *args, **kwargs):
        self.user = user
        super(IdeaIdField, self).__init__(*args, **kwargs)

    def to_python(self, value):
        '''
        Make sure the Idea id exists in database, if it is the case,
        we will return the instantiated Idea model instead of it's id.
        It will be available like so: form.cleaned_data['idea_id']
        '''
        value = super(IdeaIdField, self).to_python(value)

        # Value is not set
        if not value:
            raise forms.ValidationError('The idea id is missing.')

        # Value is not an int
        try:
            value = int(value)
        except ValueError:
            raise forms.ValidationError('The idea id must be an integer.')

        # Try to fetch the idea from database
        try:
            return Idea.objects.get(pk=value)
        except Idea.DoesNotExist:
            raise forms.ValidationError('The idea id cannot be found.')

    def validate(self, value):
        '''
        Validate the vote for an idea from the current user. At this point,
        the idea is valid, and we check whereas the user already voted for
        this idea or not.
        '''
        super(IdeaIdField, self).validate(value)

        if not self.user.id:
            raise forms.ValidationError('You must be logged in to vote.');

        number_of_votes = IdeaService.get_number_of_votes(
            self.user.id,
            value.id
        )
        if number_of_votes > 0:
           raise forms.ValidationError('You already voted for this idea.');

class VoteForm(forms.Form):

    def __init__(self, user, *args, **kwargs):
        super(VoteForm, self).__init__(*args, **kwargs)
        self.fields['idea_id'] = IdeaIdField(user)
