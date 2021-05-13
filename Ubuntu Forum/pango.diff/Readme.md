panel.diff.gz 是论坛写的和 trayer （源里有）一起用的用来提供系统栏的补丁，如果 bar 的高度是 16 个像素，需要用下面的命令运行 trayer
···
trayer --height 16 --widthtype request
···
注意，这个补丁要求 git 版的 dwm。
如果用老版的 dwm，需要给该补丁中的 resize 函数多加一个参数 True（添在最后）。