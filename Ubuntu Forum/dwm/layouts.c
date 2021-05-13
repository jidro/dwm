void
bstack(void) {
	int x, y, h, w, mh;
	unsigned int i, n;
	Client *c;

	for(n = 0, c = nexttiled(clients); c; c = nexttiled(c->next), n++);
	if(n == 0)
		return;

	c = nexttiled(clients);
	mh = mfact * wh;
	resize(c, wx, wy, ww - 2 * c->bw, (n == 1 ? wh : mh) - 2 * c->bw);

	if(--n == 0)
		return;

	x = wx;
	y = (wy + mh > c->y + c->h) ? c->y + c->h + 2 * c->bw : wy + mh;
	w = ww / n;
	h = (wy + mh > c->y + c->h) ? wy + wh - y : wh - mh;
	if(h < bh)
		h = wh;

	for(i = 0, c = nexttiled(c->next); c; c = nexttiled(c->next), i++) {
		resize(c, x, y, ((i + 1 == n) ? wx + ww - x : w) - 2 * c->bw,
		       h - 2 * c->bw);
		if(w != ww)
			x = c->x + WIDTH(c);	
	}
}

void
split(void) {
	int x, y, h, w;
	unsigned int i, n;
	Client *c;

	for(n = 0, c = nexttiled(clients); c; c = nexttiled(c->next), n++);
	if(n == 0)
		return;

	/* tile stack */
	x = wx;
	y = wy;
	w = ww;
	h = wh / n;
	if(h < bh)
		h = wh;

	for(i = 0, c = nexttiled(clients); c; c = nexttiled(c->next), i++) {
		resize(c, x, y, w - 2 * c->bw, /* remainder */ ((i + 1 == n)
		       ? wy + wh - 2 * c->bw - y : h));
		if(h != wh)
			y = c->y + HEIGHT(c);
	}
}
