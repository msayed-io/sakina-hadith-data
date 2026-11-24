CREATE TABLE collections (
  id INTEGER PRIMARY KEY,
  name_ar TEXT NOT NULL,
  edition_info TEXT NOT NULL,
  total_hadiths INTEGER NOT NULL
);

CREATE TABLE books (
  id INTEGER PRIMARY KEY,
  collection_id INTEGER NOT NULL,
  book_number INTEGER NOT NULL,
  title_ar TEXT NOT NULL,
  FOREIGN KEY (collection_id) REFERENCES collections(id)
);

CREATE TABLE chapters (
  id INTEGER PRIMARY KEY,
  collection_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  chapter_number INTEGER NOT NULL,
  title_ar TEXT NOT NULL,
  FOREIGN KEY (collection_id) REFERENCES collections(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE hadiths (
  id INTEGER PRIMARY KEY,
  collection_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  chapter_id INTEGER NOT NULL,
  hadith_number TEXT NOT NULL,
  text_tashkeel TEXT NOT NULL,
  text_plain TEXT NOT NULL,
  FOREIGN KEY (collection_id) REFERENCES collections(id),
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (chapter_id) REFERENCES chapters(id)
);

CREATE INDEX ix_books_collection ON books(collection_id, book_number);
CREATE INDEX ix_chapters_book ON chapters(book_id, chapter_number);
CREATE INDEX ix_hadiths_collection_number ON hadiths(collection_id, hadith_number);
CREATE INDEX ix_hadiths_book_chapter ON hadiths(book_id, chapter_id);
