Form Utilities
==============

Value Streams
-------------

It's useful to get FRP properties directly out of text boxes.

We listen both for change and keyup events, to keep up to date. Note that it's
keyup rather than keydown -- keydown events would give the previous value.

    Happiness.fieldValue = (selector) ->
      element = $(selector)
      Bacon.mergeAll(element.asEventStream('change'),
                     element.asEventStream('keyup'))
           .toProperty(null)
           .map(-> element.val())

