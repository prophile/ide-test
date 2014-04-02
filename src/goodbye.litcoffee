Goodbye World Example
=====================

Goodbye, world!

    console.log "Goodbye, world!"

Start The Editor
================

Deferred,

    $ ->

We start the editor.

      editor = ace.edit "editor"
      editor.setTheme "ace/theme/textmate"
      editor.getSession().setMode "ace/mode/python"

