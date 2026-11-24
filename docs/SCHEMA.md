# SQLite schema

Every published database has the same tables, foreign keys, and indexes.

## `collections`

- `id INTEGER PRIMARY KEY`
- `name_ar TEXT NOT NULL`
- `edition_info TEXT NOT NULL`
- `total_hadiths INTEGER NOT NULL`

## `books`

- `id INTEGER PRIMARY KEY`
- `collection_id INTEGER NOT NULL` → `collections.id`
- `book_number INTEGER NOT NULL`
- `title_ar TEXT NOT NULL`

## `chapters`

- `id INTEGER PRIMARY KEY`
- `collection_id INTEGER NOT NULL` → `collections.id`
- `book_id INTEGER NOT NULL` → `books.id`
- `chapter_number INTEGER NOT NULL`
- `title_ar TEXT NOT NULL`

## `hadiths`

- `id INTEGER PRIMARY KEY`
- `collection_id INTEGER NOT NULL` → `collections.id`
- `book_id INTEGER NOT NULL` → `books.id`
- `chapter_id INTEGER NOT NULL` → `chapters.id`
- `hadith_number TEXT NOT NULL`
- `text_tashkeel TEXT NOT NULL`
- `text_plain TEXT NOT NULL`

`hadith_number` is text because preserved introductory records may use values such as `intro-...`; numbered hadiths retain their source number as text.

## Core queries

```sql
-- Books in display order
SELECT id, book_number, title_ar
FROM books
WHERE collection_id = ?
ORDER BY book_number;

-- Chapters inside a book
SELECT id, chapter_number, title_ar
FROM chapters
WHERE book_id = ?
ORDER BY chapter_number;

-- Hadiths inside a chapter
SELECT hadith_number, text_tashkeel, text_plain
FROM hadiths
WHERE chapter_id = ?
ORDER BY id;
```

## Android recommendation

Use `SQLiteDatabase` or another native Android SQLite layer. Download a release asset into private app storage, verify its SHA-256 value from `manifest.json`, open it read-only, and query the hierarchy locally. Keep the database version and checksum in the app's download metadata so updates can be detected safely.
