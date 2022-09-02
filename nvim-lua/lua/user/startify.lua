
if vim.fn.has "unix" == 1 then
    local os_name = os.execute('uname -a')
	-- MacOS paths
  if string.find(os_name, "Darwin") then
    local plug_dir='~/.config/nvim/plugged'
    -- local vim.g.python3_host_prog = expand('/Library/Frameworks/Python.framework/Versions/3.9/bin/')
    -- local vim.g.gitgutter_git_executable = "/usr/local/bin/git"
    local snips_dir='~/.config/nvim/ultisnips'

    -- local g:startify_bookmarks = [
-- 		\ {'v': '~/.config/nvim/init.vim'},
-- 		\ {'p': '~/development'},
-- 		\]
  end
else
	-- Windows paths
	-- local $PATH = "C:\\Program Files\\Git\\usr\\bin;" .. $PATH
	-- local plug_dir= $HOME .. '\AppData\Local\nvim\plugged'
	-- local snips_dir= $HOME .. '\AppData\Local\nvim\ultisnips'

	-- local vim.g.python3_host_prog = expand($HOME .. '\AppData\Local\Programs\Python\Python39\python.exe')

	-- let g:startify_bookmarks = [
	-- \ {'v': $HOME . '\AppData\Local\nvim\init.vim'},
	-- \ {'d': $HOME . '\dotfiles'},
	-- \ {'p': $HOME . '\dev'},
	-- \ {'r': $WORK },
	-- \]
end
