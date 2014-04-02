Goodbye World Example
=====================

Goodbye, world!

    console.log "Goodbye, world!"

Start The Editor
================

Deferred,

    $ ->

First, we grab a Firebase connection.

      firebase = new Firebase('https://resplendent-fire-5939.firebaseio.com/')

We start the editor.

      editor = ace.edit "editor"
      editor.setTheme "ace/theme/textmate"
      editor.getSession().setMode "ace/mode/python"

Finally, we hook the editor up to firebase.

      firepad = Firepad.fromACE firebase, editor

Hide the firepad advertising, while we're at it.

      $('.powered-by-firepad').hide()

