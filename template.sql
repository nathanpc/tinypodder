CREATE TABLE feeds(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT NOT NULL,
	url TEXT NOT NULL,
	last_refreshed INTEGER,
	last_downloaded INTEGER
);
