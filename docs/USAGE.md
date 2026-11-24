# Usage guide for application developers

## Download flow

1. Read the latest release manifest.
2. Present the nine collections as selectable downloads.
3. Download only the selected `.db` asset.
4. Verify its SHA-256 checksum.
5. Store it in private application storage.
6. Open it read-only with native SQLite.
7. Expose collections, books, chapters, and hadiths as separate UI levels.

## Suggested UI hierarchy

`Source card → Books index → Chapters index → Hadith list → Hadith reader`

Do not treat a book title as a chapter. The `book_id` and `chapter_id` foreign keys are available for this separation. Introductory material can be hidden from the default path by filtering the explicitly documented introduction book, while keeping it available through an optional information path.

## Update policy

Treat release versions as immutable. To update data, compare the app's stored release version and checksum with the new manifest, download the new asset, verify it, then atomically replace the local file. Never replace a database before checksum verification succeeds.
