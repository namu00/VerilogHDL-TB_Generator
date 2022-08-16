import argparse
import itertools
import json5
import jsonschema
import time
import traceback
import sys

if __name__ == "__main__":
	# Preserve newlines in docstring:
	parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter)
	parser.epilog = __doc__
	parser.add_argument("src", help="WaveJSON source file")
	parser.add_argument("-w", "--watch", action="store_true",
		help="Watch file, continuously update and redraw")
	parser.add_argument("-g", "--graphics", choices=["default", "tiny", "tall"],
		default="default", help="Use a different graphics tileset")
	parser.add_argument("--hscale", type=posint,
		help="Force hscale to a different value than specified in src config.")
	args = parser.parse_args()

	graphics = {
		"default": graphics_default,
		"tiny": graphics_tiny,
		"tall": graphics_tall
	}[args.graphics]

	if args.watch:
		prev_src = None
		while True:
			ifile = open(args.src)
			src = ifile.read()
			ifile.close()
			if src != prev_src:
				print("\033[H\033[J") # VT100 clear command
				try:
					render_json(src, sys.stdout, graphics, force_hscale=args.hscale)
				except Exception:
					traceback.print_exc(file=sys.stdout)
				print("\nWatching file " + args.src)
				print("Ctrl-C to exit")
				prev_src = src
			time.sleep(0.2)
	else:
		ifile = open(args.src)
		render_json(ifile.read(), sys.stdout, graphics, force_hscale=args.hscale)