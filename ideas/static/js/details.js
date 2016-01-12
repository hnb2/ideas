/* global $, Cookies */
$(document).ready(function () {

    /**
     * These HTTP methods do not require CSRF protection
     * Source: https://docs.djangoproject.com/en/1.8/ref/csrf/
     */
    function csrfSafeMethod(method) {
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }

    $.ajaxSetup({
        beforeSend: function (xhr, settings) {
            if (
                !csrfSafeMethod(settings.type) &&
                !this.crossDomain
            ) {
                xhr.setRequestHeader(
                    'X-CSRFToken',
                    Cookies.get('csrftoken')
                );
            }
        }
    });

    /**
     * TODO
     */
    var getIdeaId = function () {
        var matches = window.location.href.match(
            /http:\/\/.*\/ideas\/idea\/(.*)\//
        );

        return matches[1];
    };

    /**
     * TODO
     */
    var voteSuccess = function (data) {
        console.log(data);
        $('#vote-count').text(data.votes);
        $('.vote-buttons').remove();
    };

    /**
     * TODO
     */
    var voteFailure = function (jqXHR, textStatus, errorThrown) {
        console.error(textStatus + ' : ' + errorThrown);
    };

    /**
     * Careful, this is based on the id of the clicked element.
     * It has to be id'd 'upvote' and 'downvote'
     */
    var vote = function (e) {
        var voteType = e.currentTarget.id;

        $.ajax({
            url: '/ideas/' + voteType + '/',
            contentType: 'application/json; charset=utf-8',
            method: 'POST',
            data: JSON.stringify({idea_id: getIdeaId()})
        }).done(
            voteSuccess
        ).fail(
            voteFailure
        );
    };

    $('#upvote').on('click', vote);
    $('#downvote').on('click', vote);
});
