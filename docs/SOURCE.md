# Source and provenance

## Original source

The nine collections were extracted from the Shamela 1448 database archive:

- Direct archive: https://dev.shamela.ws/downloads/shamela-database-1448.zip
- Shamela website: https://shamela.ws/

The source archive was downloaded and its ZIP integrity was tested before extraction. The selected source Book IDs are recorded in `source_book_ids.json` and in the build report.

## Selected source collections

| Collection | Shamela Book ID |
|---|---:|
| صحيح البخاري | 1681 |
| صحيح مسلم | 1727 |
| سنن أبي داود | 117359 |
| جامع الترمذي | 7895 |
| سنن النسائي | 1339 |
| سنن ابن ماجه | 1198 |
| موطأ مالك | 1699 |
| مسند الإمام أحمد | 25794 |
| سنن الدارمي | 21795 |

## Transformation boundary

The build process copies the Arabic page text represented by the extracted source pages. It does not translate, summarize, paraphrase, or rewrite hadith text. `text_tashkeel` preserves the source text used by the build, while `text_plain` is a deterministic search form produced by removing diacritics and normalizing selected Arabic letters.

Book and chapter labels are derived from the source title hierarchy. When the source HTML contains `data-type="title"` and `toc-{id}`, that exact source title marker is used and linked to the original `title.id`. When a source book has no child title node, the database uses an explicit technical label indicating that no independent chapter node exists; it does not present hadith commentary as an original chapter title.

See `original_hierarchy_provenance_titlefix_v3.json` in the release for the complete source-title mapping.
