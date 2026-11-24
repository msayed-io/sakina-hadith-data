# Validation and quality checks

The release build was validated before publication.

## Content checks

- 52,863 hadith rows and preserved introductory rows.
- The new build's hadith content matches the previous verified build exactly by collection, number, `text_tashkeel`, and `text_plain`.
- Empty hadith texts: 0.
- The complete Sahih Muslim introduction remains stored.

## SQLite checks

- `PRAGMA integrity_check`: `ok`.
- `PRAGMA foreign_key_check`: no violations.
- Same schema tables and indexes across the master and all nine split databases.

## Hierarchy checks

- All nine source root-book counts match the database book counts after excluding the explicit introduction aggregate where applicable.
- Source-title provenance records the original `title_id`, page, parent, and corresponding database row.
- Nine books have no independent child `title` node in the source. They are represented with the explicit non-source label `أحاديث الكتاب — لا توجد عقدة باب مستقلة في المصدر` rather than an invented chapter title.

## Split checks

Each split database was compared against the new master database for:

- schema;
- every row in every table;
- Arabic text with and without diacritics;
- hadith numbers and order;
- book and chapter order;
- foreign keys and SQLite integrity;
- ZIP archive integrity.

Result: `all_pass = true`, `zip_test_pass = true`.

## Reproducibility files

The release includes the build report, split manifest, split verification result, source-title provenance JSON, and SHA-256 checksums for every database asset.
