local wk = require("which-key")
wk.register({ s = "Search"}, { prefix = "<leader>" })
wk.register({ u = "Undo Tree"}, { prefix = "<leader>" })
wk.register({ e = "Explorer"}, { prefix = "<leader>" })

wk.register({
	f  = {
		name = "Find",
		l = "Local",
		g = "Git"
	}
},
{ prefix = "<leader>" }
)

wk.register({
	g  = {
		name = "Git",
		s = "status",
	}
},
{ prefix = "<leader>" }
)


wk.register({
	h  = {
		name = "Harpoon",
		a = "Add To Jump List",
		m = "Quick Menu",
		s = "Jump To File 1",
		t = "Jump To File 2",
		u = "Jump To File 3",
		v = "Jump To File 4"
	}
},
{ prefix = "<leader>" }
)

wk.register({
	l  = {
		name = "LSP",
		g = "Go To Defintion",
		f = "Open Float",
		p = "Previous Diagnostic",
		n = "Next Diagnostic",
		a = "Code Action",
		r = "Rename"
	}
},
{ prefix = "<leader>" }
)


