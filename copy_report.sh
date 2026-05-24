#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./copy_report.sh DEST_DIR REPORT

REPORT:
  en             copy report_en.tex
  ja             copy report_ja.tex
  report_en.tex  copy report_en.tex
  report_ja.tex  copy report_ja.tex

The selected report is copied to DEST_DIR/report.tex.
USAGE
}

if [[ $# -ne 2 ]]; then
  usage >&2
  exit 2
fi

dest_dir=$1
report_arg=$2

case "$report_arg" in
  en)
    report_file=report_en.tex
    ;;
  ja)
    report_file=report_ja.tex
    ;;
  report_en.tex | report_ja.tex)
    report_file=$report_arg
    ;;
  *)
    echo "Error: REPORT must be one of: en, ja, report_en.tex, report_ja.tex" >&2
    exit 2
    ;;
esac

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
latexmkrc="$repo_dir/.latexmkrc"
report_src="$repo_dir/$report_file"

if [[ ! -f "$latexmkrc" ]]; then
  echo "Error: missing $latexmkrc" >&2
  exit 1
fi

if [[ ! -f "$report_src" ]]; then
  echo "Error: missing $report_src" >&2
  exit 1
fi

mkdir -p "$dest_dir"
cp "$latexmkrc" "$dest_dir/.latexmkrc"
cp "$report_src" "$dest_dir/report.tex"

echo "Copied .latexmkrc and $report_file to $dest_dir"
