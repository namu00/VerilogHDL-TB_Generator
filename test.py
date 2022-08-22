def cmd_10(cmd, prev_cmd, width, charwidth, data, put):
	h_cmds = "1hHu"
	l_cmds = "0lLd"
	high = cmd in h_cmds
	hard_edge = cmd in "HL" or \
		(high and prev_cmd in (l_cmds + "zx=2345")) or \
		(not high and prev_cmd in (h_cmds + "zx=2345")) or \
		(cmd in "1h" and prev_cmd in "1pP") or \
		(cmd in "0l" and prev_cmd in "0nN")
	if cmd == "u":
		edge, flat = ("U", "u")
	elif cmd == "d":
		edge, flat = ("D", "d")
	elif cmd == "H":
		edge, flat = ("r", "1")
	elif cmd == "L":
		edge, flat = ("f", "0")
	elif high:
		edge, flat = ("+", "1")
	else:
		edge, flat = ("-", "0")
	rendered = edge * hard_edge + flat * (width - hard_edge)
	for s in rendered:
		put(s)


def cmd_separator(cmd, prev_cmd, width, charwidth, data, put):
	put("|")


def cmd_other(cmd, prev_cmd, width, charwidth, data, put):
	for i in range(width):
		put(cmd.lower())

# Create callback for appending some wave state's graphics to an array of strings
def create_put(outs, graphics_map):
	def put(c, raw_char=False):
		for i in range(len(outs)):
			if raw_char:
				outs[i] += c if i == len(outs) // 2 else " "
			else:
				outs[i] += graphics_map[c][i]
	return put

def render_signal(wave, data, charwidth, graphics_map):
	if not hasattr(render_signal, "handlers"):
		render_signal.handlers = {}
		for c in "1hHu0lLd":
			render_signal.handlers[c] = cmd_10
		for c in "pPnN":
			render_signal.handlers[c] = cmd_clk
		for c in "=2345":
			render_signal.handlers[c] = cmd_bus
		for c in "xXzZ":
      
      
      
			render_signal.handlers[c] = cmd_other
		render_signal.handlers["|"] = cmd_separator
	assert(charwidth >=4 and charwidth % 2 == 0)

	outs = [""] * len(graphics_map[" "])
	put = create_put(outs, graphics_map)
	if type(data) is str:
		data = data.split()
	else:
		data = data[:]
	prev_cmd = "x"
	wstream = iter(wave)

	while True:
		cmd = next(wstream, None)
		if cmd is None:
			break
		if cmd == ".":
			cmd = prev_cmd
		if cmd not in render_signal.handlers:
			cmd = "x"
		width = charwidth
		# . refers to command *before* |, so terminate early and don't touch prev_cmd
		while cmd != "|":
			next_cmd = next(wstream, None)
			if next_cmd == ".":
				width += charwidth
			else:
				wstream = itertools.chain([next_cmd], wstream)
				break
		render_signal.handlers[cmd](cmd, prev_cmd, width, charwidth, data, put)
		if cmd != "|":
			prev_cmd = cmd

	return outs