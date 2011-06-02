Mercury.config =

  # Saving
  #
  # When saving content, it can be sent to the server as JSON, or as normal form variables.
  #
  saveStyle: 'json' # or 'form'


  # Ignored Links
  #
  # Links need to be specially handled because the editor loads content into an iframe, and to ensure that links load
  # outsite of the content iframe they're "hijacked" to load in the _top window.  This allow for displaying a
  # confirmation when leaving an edited page.  There are times when you may be observing clicks on anchor tags and you
  # might not want this behavior, for instance a link that pops a modal.  You can add classnames to this array and the
  # special handling won't be attached to anchors that have them.
  #
  ignoredLinks: ['lightview'],


  # Image Uploading (via editable regions)
  #
  # If you drag images (while pressing shift) from your desktop into an editable region it will be uploaded to the
  # server and inserted into the region.  This configuration allows you to specify if you want to disable this feature,
  # the accepted mime-types, file size restrictions, and other things related to uploading.
  #
  uploading:
    enabled: true
    allowedMimeTypes: ['image/jpeg', 'image/gif', 'image/png']
    maxFileSize: 1235242880 # bytes (5 Mb by default)
    inputName: 'image[image]'
    url: '/images'


  # Toolbars
  #
  # This is where you can customize the toolbar by adding new ones, and add or change buttons and their behaviors.  Any
  # top level object put here will create a new toolbar.  Buttons are nested inside the toolbars.  Some toolbars are
  # custom (the snippetable one for instance), and to denote that a custom toolbar, use _custom: true.
  #
  # Buttons can be grouped.  A button group is simply a way to wrap buttons for styling, and can also handle enabling or
  # disabling all the buttons within it by using a context.  The table button group is a good example of this.
  #
  # It's important to note that each of the names (keys), in this object must be unique, regardless of if it's in a
  # button group, or nested, etc.  This is because styling is applied to them by name.
  #
  # Button format: [label, description, {type: action, type: action, etc}] The available button types are:
  #
  # button:  (default) calls handleCommand and passes the key of the object
  #          (eg. save, preview, undo etc.)
  # toggle:  toggles on or off when clicked, otherwise behaves like a button
  # modal:   opens a modal window, expects the action to be one of:
  #            a string url
  #            a function that returns a string url
  # panel:   opens a panel dialog, expects the action to be one of:
  #            a string url
  #            a function that returns a string url
  # palette: opens a palette window, expects the action to be one of:
  #            a string url
  #            a function that returns a string url
  # select:  opens a pulldown style window, expects the action to be one of:
  #            a string url
  #            a function that returns a string url
  # context: calls a callback function, expects the action to be:
  #            a function that returns a boolean to highlight the button
  #            note: if a function isn't provided, the key will be passed to the contextHandler (eg. backcolor, bold),
  #                  in which case default context will be used (for more info read the Contexts section below)
  # mode:    toggle a given mode in the editor, expects the action to be:
  #            a string, denoting the name of the mode
  #            note: it's assumed that when a specific mode is turned on, all other modes will be turned off which
  #                  happens automatically, thus putting the editor into a specific "state"
  # regions: allows buttons to be enabled/disabled based on what region type
  #          has focus, expects the action to be.
  #            an array of region types (eg. ['editable', 'snippetable']
  #            a function that returns an array
  # preload: preloads views when the editor is loaded instead of on first open
  #          (only used for panels, selects, and palettes, otherwise ignored)
  #
  # Separators are any "button" that's not an array, and are expected to be a string.  You can use two different
  # separator styles: line, and spacer.
  # '-' = line
  # ' ' = spacer
  #
  toolbars:
    primary:
      save:                  ['Save', 'Save this page']
      preview:               ['Preview', 'Preview this page', {toggle: true, mode: true}]
      sep1:                  ' '
      undoredo:
        undo:                ['Undo', 'Undo your last action']
        redo:                ['Redo', 'Redo your last action']
        sep:                 ' '
      insertlink:            ['Link', 'Insert Link', {modal: '/mercury/modals/link', regions: ['editable']}]
      insertmedia:           ['Media', 'Insert Media (images and videos)', {modal: '/mercury/modals/media', regions: ['editable']}]
      inserttable:           ['Table', 'Insert Table', {modal: '/mercury/modals/table', regions: ['editable']}]
      insertcharacter:       ['Character', 'Special Characters', {modal: '/mercury/modals/character', regions: ['editable']}]
      objectspanel:          ['Snippet', 'Snippet Panel', {panel: -> "/mercury/panels/snippets"}]
      sep2:                  ' '
#      historypanel:          ['History', 'Page Version History', {panel: -> "/mercury/panels/history"}]
#      sep3:                  ' '
      notespanel:            ['Notes', 'Page Notes', {panel: '/mercury/panels/notes'}]
      todospanel:            ['Todos', 'Page Todos', {panel: '/mercury/panels/todos'}]

    editable:
      predefined:
        style:               ['Style', null, {select: '/mercury/selects/style', preload: true}]
        sep1:                ' '
        formatblock:         ['Block Format', null, {select: '/mercury/selects/formatblock', preload: true}]
        sep2:                '-'
      colors:
        backcolor:           ['Background Color', null, {palette: '/mercury/palettes/backcolor', context: true, preload: true}]
        sep1:                ' '
        forecolor:           ['Text Color', null, {palette: '/mercury/palettes/forecolor', context: true, preload: true}]
        sep2:                '-'
      decoration:
        bold:                ['Bold', null, {context: true}]
        italic:              ['Italicize', null, {context: true}]
        overline:            ['Overline', null, {context: true}]
        strikethrough:       ['Strikethrough', null, {context: true}]
        underline:           ['Underline', null, {context: true}]
        sep:                 '-'
      script:
        subscript:           ['Subscript', null, {context: true}]
        superscript:         ['Superscript', null, {context: true}]
        sep:                 '-'
      justify:
        justifyleft:         ['Align Left', null, {context: true}]
        justifycenter:       ['Center', null, {context: true}]
        justifyright:        ['Align Right', null, {context: true}]
        justifyfull:         ['Justify Full', null, {context: true}]
        sep:                 '-'
      list:
        insertunorderedlist: ['Unordered List', null, {context: true}]
        insertorderedlist:   ['Numbered List', null, {context: true}]
        sep:                 '-'
      indent:
        outdent:             ['Decrease Indentation', null]
        indent:              ['Increase Indentation', null]
        sep:                 '-'
      table:
        _context:            true
        insertrowbefore:     ['Insert Table Row', 'Insert a table row before the cursor']
        insertrowafter:      ['Insert Table Row', 'Insert a table row after the cursor']
        deleterow:           ['Delete Table Row', 'Delete this table row']
        insertcolumnbefore:  ['Insert Table Column', 'Insert a table column before the cursor']
        insertcolumnafter:   ['Insert Table Column', 'Insert a table column after the cursor']
        deletecolumn:        ['Delete Table Column', 'Delete this table column']
        sep1:                ' '
        increasecolspan:     ['Increase Cell Columns', 'Increase the cells colspan']
        decreasecolspan:     ['Decrease Cell Columns', 'Decrease the cells colspan and add a new cell']
        increaserowspan:     ['Increase Cell Rows', 'Increase the cells rowspan']
        decreaserowspan:     ['Decrease Cell Rows', 'Decrease the cells rowspan and add a new cell']
        sep2:                '-'
      rules:
        horizontalrule:      ['Horizontal Rule', 'Insert a horizontal rule']
        sep:                 '-'
      formatting:
        removeformatting:    ['Remove Formatting', 'Remove formatting for the selection']
        sep:                 ' '
      editors:
        htmleditor:          ['Edit HTML', 'Edit the HTML content'] # example behavior below

    snippetable:
      _custom:               true
      actions:
        editsnippet:         ['Edit Snippet Settings', null]
        sep1:                ' '
        removesnippet:       ['Remove Snippet', null]


  # Behaviors
  #
  # Behaviors are used to change the default behaviors of a given region type when a given button is clicked.  For
  # example, you may prefer to add HR tags using an HR wrapped within a div with a classname (for styling).  You can add
  # your own complex behaviors here.
  #
  # You can see how the behavior matches up directly with the button name.  It's also important to note that the
  # callback functions are executed within the scope of the given region, so you have access to all it's methods.
  #
  behaviors:
    horizontalrule: (selection) -> selection.replace('<hr/>')

    htmleditor: ->
      Mercury.modal '/mercury/modals/htmleditor', {
        title: 'HTML Editor',
        fullHeight: true,
        handler: 'htmleditor'
      }


  # Contexts
  #
  # Contexts are used callback functions used for highlighting and disabling/enabling buttons and buttongroups.  When
  # the cursor enters an element within an html region for instance we want to disable or highlight buttons based on the
  # properties of the given node.
  #
  # You can see some examples of contexts in:
  #
  # Mercury.Toolbar.Button.contexts
  # and
  # Mercury.Toolbar.ButtonGroup.contexts
  #