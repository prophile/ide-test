Login Component
===============

The login component handles everything within the login mode.

Inputs
------

The three inputs are the two boxes (username and password), and an event stream for the submit button.

    $ ->
      window.Happiness.LoginComponent =
        currentUsername: Happiness.fieldValue '#username'
        currentPassword: Happiness.fieldValue '#password'
        submit: $('#login').asEventStream('click')

