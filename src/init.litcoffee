Initialisation
==============

Storage
-------

We put all the bits and pieces that need global access in a global variable
called 'Happiness'. This keeps everything nice and constrained.

    window.Happiness = {}

Starting the Editor
-------------------

Deferred,

    $ ->

First, we grab a Firebase connection.

      BASE_URI = 'https://resplendent-fire-5939.firebaseio.com/'

      firebase = new Firebase(BASE_URI + '/SRZ/proj1/bees')

We start the editor.

      editor = ace.edit "editor"
      editor.setTheme "ace/theme/textmate"
      editor.getSession().setMode "ace/mode/python"

Finally, we hook the editor up to firebase.

      firepad = Firepad.fromACE firebase, editor

Hide the firepad advertising, while we're at it.

      $('.powered-by-firepad').hide()

