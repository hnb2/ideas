from django import template

register = template.Library()

@register.simple_tag
def format_date(date):
    '''
    TODO
    '''
    return date.strftime('%d %b %Y')

@register.simple_tag
def format_date_time(date):
    '''
    TODO
    '''
    return date.strftime('%d %b %Y, %H:%M')
