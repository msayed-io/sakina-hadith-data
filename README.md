<div align="center">

<img src="assets/sakina-hadith-mark.png" alt="Sakina Hadith Data mark" width="180">

# Sakina Hadith Data

**Verified SQLite databases for nine major hadith collections**

قواعد SQLite موثقة ومتحقق منها لكتب الحديث التسعة، مهيأة للتوزيع والتنزيل المحلي داخل تطبيقات Android وغيرها.

[Latest Release](../../releases/latest) · [Documentation](docs/USAGE.md) · [Direct Downloads](docs/RELEASES.md)

</div>

![Sakina Hadith Data cover](assets/sakina-hadith-cover.png)

Verified, distributable SQLite databases for nine major hadith collections used by Sakina and other Islamic applications.

## Download

All database files are published as assets of the latest GitHub Release. Each collection has its own SQLite file and direct download URL. See [the latest release](../../releases/latest), the [direct-download guide](docs/RELEASES.md), or the machine-readable [manifest](manifest.json).

## Included collections

1. Sahih al-Bukhari — صحيح البخاري
2. Sahih Muslim — صحيح مسلم
3. Sunan Abi Dawud — سنن أبي داود
4. Jami` al-Tirmidhi — جامع الترمذي
5. Sunan al-Nasa'i — سنن النسائي
6. Sunan Ibn Majah — سنن ابن ماجه
7. Muwatta Malik — موطأ مالك
8. Musnad Ahmad — مسند الإمام أحمد
9. Sunan al-Darimi — سنن الدارمي

## Source and provenance

The source archive is the Shamela 1448 database distribution:

- Archive: https://dev.shamela.ws/downloads/shamela-database-1448.zip
- Shamela platform: https://shamela.ws/

The databases were rebuilt from the original source SQLite files extracted from the archive. Hadith text was not rewritten. The repository documents the source, transformation boundaries, schema, validation, and provenance. See [SOURCE.md](docs/SOURCE.md), [SCHEMA.md](docs/SCHEMA.md), and [VALIDATION.md](docs/VALIDATION.md).

## Data model

Every database uses the same schema:

`collections → books → chapters → hadiths`

The introduction and preface material remains preserved where present. Applications may hide it from the default reading path without deleting it from the database.

## Recommended Android integration

Download only the collection selected by the user, verify its SHA-256 checksum, store it in the app's private files directory, open it with Android's native SQLite APIs, and query books, chapters, and hadiths locally. Do not load the database through a web page or IndexedDB when native SQLite is available.

Example release asset pattern:

```text
https://github.com/msayed-io/sakina-hadith-data/releases/download/v1.0.0/sakina_bukhari.db
```

Check the release manifest before hard-coding asset URLs. The release assets are versioned and immutable by convention.

## Integrity status

The published build was checked for schema equality, row equality, Arabic text equality, hadith-number ordering, SQLite integrity, foreign keys, ZIP validity, and source-title provenance. The full validation report is included in the release and summarized in [VALIDATION.md](docs/VALIDATION.md).

## License and attribution

This repository is a distribution and documentation layer for data originating from the Shamela archive. Consult the original source and its terms before redistribution or commercial use. Preserve source attribution in applications that use these files.
