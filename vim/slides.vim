fun! slides#list()
  return split(glob(g:slides_glob))
endfun

fun! slides#open(idx)
  exec 'edit ' . slides#list()[a:idx]
endfun

fun! slides#next()
  let slides = slides#list()
  let idx = index(slides, expand('%'))
  if idx < 0
    return
  endif

  let idx = min([idx + 1, len(slides) - 1])

  exec 'edit' fnameescape(slides[idx])
endfun

fun! slides#prev()
  let slides = slides#list()
  let idx = index(slides, expand('%'))
  if idx < 0
    return
  endif

  let idx = max([idx - 1, 0])

  exec 'edit' fnameescape(slides[idx])
endfun

fun! slides#first()
  let slides = slides#list()
  let idx = index(slides, expand('%'))
  if idx < 0
    return
  endif

  exec 'edit' fnameescape(slides[0])
endfun

fun! slides#last()
  let slides = slides#list()
  let idx = index(slides, expand('%'))
  if idx < 0
    return
  endif

  exec 'edit' fnameescape(slides[-1])
endfun

fun! slides#start()
  let slides = slides#list()
  if len(slides) > 0
    exec 'edit' fnameescape(slides[0])
  endif
endfun

fun! slides#del()
  let slides = slides#list()
  let idx = index(slides, expand('%'))

  if idx < 0
    return
  endif

  let idx = idx % (len(slides) - 1)

  call delete(expand('%'))

  call slides#open(idx)
endfun

fun! slides#mv(dest)
   let old = expand('%')

   exec 'saveas' fnameescape(a:dest)

   call delete(old)
endfun
