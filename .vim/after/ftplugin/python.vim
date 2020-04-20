setlocal makeprg=pylint\ -r\ n\ -s\ n\ --output-format=parseable\ %:p
setlocal errorformat=%f:%l:\ %m

" Cleanups
let b:undo_ftplugin .= '| setlocal makeprg< errorformat< path<'
