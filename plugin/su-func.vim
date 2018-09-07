if has("gui")
	map <special> <silent> <C-K> :call RestoreWin()<CR>" ---Restore
	map <special> <silent> <C-M> :call MaxWin()<CR>" ---Maximize
	map <special> <silent> <C-N> :call MinWin()<CR>" ---Minimize
endif

function! EditRc()
	if "" == expand("%:p")
		:edit ~/.vimrc
	elseif ".vimrc" != expand("%:t")
		:split ~/.vimrc
	endif
endfunction

function! Test()
	let s:buf_name = "suren"

	if !bufexists(s:buf_name) || bufwinnr(s:buf_name) == -1
		25vsplit suren

		set modifiable
		set buftype=nofile

		redir @a
		silent map
		redir END

		silent execute "normal " . '"ap'
		silent :%substitute/^\n// 
		silent :global!/\s*:call.*---/delete 
		silent :%substitute/\s*:call.*---/\t/
		silent :%substitute/^\s*//
		silent :nohlsearch
		sort

		set nowrap
		set colorcolumn=""
		set readonly
		set nomodifiable
	endif
endfunction

function! SubString(str, begin, len)
	let str=a:str
	let begin=a:begin
	let len=a:len
	let length=begin+len
	let rv=""

	while begin < length
		let rv=rv.str[begin]

		let begin=begin+1
	endwhile

	return rv
endfunction

function! IndexOf(str, sub)
	let str=a:str
	let sub=a:sub
	let subLen=strlen(sub)
	let len=strlen(str)
	let len=len-subLen+1
	let i=0

	while i < len
		if SubString(str, i, subLen) == sub
			return i
		endif

		let i=i+1
	endwhile

	return -1
endfunction

function! LastIndexOf(str, sub)
	let str=a:str
	let sub=a:sub
	let len=strlen(str)
	let subLen=strlen(sub)
	let i=len-subLen

	while i >= 0
		if SubString(str, i,subLen) == sub
			return i
		endif

		let i=i-1
	endwhile

	return -1
endfunction

function! SortFunc(x, y)
	let s:index = 0
	let s:x_list = split(a:x)
	let s:y_list = split(a:y)
	let s:x_len = len(s:x_list)
	let s:y_len = len(s:y_list)
	let s:x_is_num = 0
	let s:y_is_num = 0

	if s:x_list == s:y_list
		return 0
	elseif s:x_len == 0
		return -1
	elseif s:y_len == 0
		return 1
	endif

	for i in s:x_list
		let s:x = i
		let s:y = s:y_list[s:index]
		let s:x_is_num = s:x + 0
		let s:y_is_num = s:y + 0

		if s:x_is_num != 0
			let s:x = s:x_is_num
		endif

		if s:y_is_num != 0
			let s:y = s:y_is_num
		endif

		if s:x > s:y
			return 1
		endif

		if s:x < s:y
			return -1
		endif

		let s:index = s:index + 1

		if s:index >= s:y_len
			break
		endif
	endfor

	return 0
endfunction

function! Sort(from, to)
	let s:begin = a:from + 0
	let s:end = a:to + 0

	if s:begin <= 0
		let s:begin = 1
	endif

	if s:end <= 0
		let s:end = 1
	endif

	if s:begin > line("$") || s:end > line("$")
		return
	endif

	let s:content = getline(s:begin, s:end)
	let s:content = sort(s:content, "SortFunc")

	call DeleteLine(s:begin, s:end)
	call append(s:begin - 1, s:content)
	$delete
endfunction

function! DeleteLine(from, to)
	let s:begin = a:from + 0
	let s:end = a:to + 0

	if s:begin < 0 || s:begin > line("$")
		return
	endif

	if s:end < 0 || s:end > line("$")
		return
	endif

	execute "normal " . s:begin . "gg"
	execute ":" . s:begin . "," . s:end . "delete"
endfunction

function! Quit()
	silent :quit
endfunction

function! ContentReload()
	silent :e
	execute "normal G"
endfunction

function! OpenShell()
	if has("gui_win32")
		silent execute "!start cmd"
	endif
endfunction

function! OpenTaskMgr()
	if has("gui_win32")
		silent execute "!start taskmgr"
	endif
endfunction

if !exists("*ReloadRc")
	function! ReloadRc()
		silent :source ~/.vimrc
	endfunction
endif

if !exists("*ReloadFile")
	function! ReloadFile()
		silent :e
		execute "normal " . s:begin . "G"
	endfunction
endif

function! SwapMouse()
	let s:suren_lib = findfile("suren.dll", &runtimepath)

	if s:suren_lib != ""
		call libcall(s:suren_lib, "SwapMouse", "")
	endif
endfunction

function! ToggleFullScreen()
	let s:suren_lib_str = "suren.dll"
	let s:suren_lib = findfile(s:suren_lib_str, &runtimepath)

	if !exists("s:suren_fullscreen")
		let s:suren_fullscreen = 0
	endif

	if s:suren_lib != ""
		let s:suren_lib = s:suren_lib_str

		if s:suren_fullscreen == 0
			echo s:suren_lib
			let s:suren_win_info =  libcall(s:suren_lib, "FullScreen", "")

			if len(split(s:suren_win_info)) == 4
				let s:suren_win_last_left = split(s:suren_win_info)[0] + 0
				let s:suren_win_last_top = split(s:suren_win_info)[1] + 0
				let s:suren_win_last_right = split(s:suren_win_info)[2] + 0
				let s:suren_win_last_bottom = split(s:suren_win_info)[3] + 0

				set guioptions-=m
				set guioptions-=T

				let s:suren_fullscreen = 1
			endif
		else
			call libcall(s:suren_lib, "FullScreen", "")

			call libcall(s:suren_lib, "SetPosX", s:suren_win_last_left)
			call libcall(s:suren_lib, "SetPosY", s:suren_win_last_top)
			call libcall(s:suren_lib, "SetWinWidth",
				\ s:suren_win_last_right - s:suren_win_last_left)
			call libcall(s:suren_lib, "SetWinHeight",
				\ s:suren_win_last_bottom - s:suren_win_last_top)

			set guioptions+=m
			set guioptions+=T

			let s:suren_fullscreen = 0
		endif
	else
		echo "can't found " . s:suren_lib_str
	endif
endfunction

function! MaxWin()
	simalt ~x
endfunction

function! MinWin()
	simalt ~n
endfunction

function! RestoreWin()
	simalt ~r
endfunction

function! SwitchWin()
	execute "normal \<C-W>\<C-W>"
endfunction

function! Save()
	let s:path = expand("%:p")
	
	if s:path == ""
		if has("gui")
			execute ":browse confirm saveas"
		else
			let s:path = input("saveas:")
			execute ":write " . s:path
		endif
	else
		execute ":write"
	endif
endfunction

function! Su()
  echo col('.')
  echo getline(col('.'))
  echo getline('.')
  echo IndexOf(getline('.'), ":")
  echo SubString(getline('.'), 0, IndexOf(getline('.'), ":"))
  return SubString(getline('.'), 0, IndexOf(getline('.'), ":"))
endfunction

function! ExecMakefile()
  echo "sefe"
  let cmd=Su()
  execute "!make " . cmd
endfunction
