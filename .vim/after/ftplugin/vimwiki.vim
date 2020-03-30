augroup vimwiki
    au! BufRead      Home.md :Start! git pull
    au! BufWritePost *       :Start! git add "%";git commit -m "Auto commit of %:t.";git push
augroup END

