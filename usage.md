# copy_report.sh Usage

`copy_report.sh` copies one report source file and the repository `.latexmkrc` into a target directory.
The selected report is always renamed to `report.tex` in the target directory.

## Command

```bash
./copy_report.sh DEST_DIR REPORT
```

## Arguments

- `DEST_DIR`: Target directory. It is created automatically if it does not exist.
- `REPORT`: Report version to copy. Allowed values are:
  - `en`: copy `report_en.tex`
  - `ja`: copy `report_ja.tex`
  - `report_en.tex`: copy `report_en.tex`
  - `report_ja.tex`: copy `report_ja.tex`

## Examples

Copy the English report:

```bash
./copy_report.sh /tmp/report en
```

This creates or updates:

```text
/tmp/report/.latexmkrc
/tmp/report/report.tex
```

Copy the Japanese report:

```bash
./copy_report.sh /tmp/report ja
```

## Behavior

The script copies these files:

- `.latexmkrc` to `DEST_DIR/.latexmkrc`
- The selected report file to `DEST_DIR/report.tex`

The script validates that the source `.latexmkrc` and selected source report exist before copying.

## Error Handling

The script exits with an error when:

- The number of arguments is not exactly two.
- `REPORT` is not one of the supported values.
- The repository `.latexmkrc` file is missing.
- The selected source report file is missing.
- The target path cannot be created as a directory.
- Files cannot be copied, for example because of permissions.

## Existing Files In Target Directory

If `DEST_DIR/report.tex` already exists, it is overwritten.

If `DEST_DIR/.latexmkrc` already exists, it is overwritten.

The current script does not ask for confirmation, create backups, or refuse to overwrite existing files.
