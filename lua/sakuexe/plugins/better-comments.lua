local comments_setup, comments = pcall(require, "better-comment")
if not comments_setup then
	print("better comments not working")
	return
end

comments.Setup({
	tags = {
		{
			name = "TODO",
			fg = "white",
			bg = "#-1a7aca",
			bold = true,
			virtual_text = "",
		},
		{
			name = "FIX",
			fg = "white",
			bg = "#f44746",
			bold = true,
			virtual_text = "This is virtual Text from FIX",
		},
		{
			name = "WARNING",
			fg = "#FFA499",
			bg = "",
			bold = false,
			virtual_text = "This is virtual Text from WARNING",
		},
		{
			name = "!",
			fg = "#f44746",
			bg = "",
			bold = true,
			virtual_text = "",
		},
		{
			name = "DEPRECATED",
			fg = "#d96038",
			bg = "",
			bold = true,
			virtual_text = "Deprecation warning",
		},
	},
})
