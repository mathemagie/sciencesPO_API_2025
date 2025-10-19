# Repository Guidelines

## Project Structure & Module Organization
- `create.sh` orchestrates the full story pipeline: it templatizes `prompt2.txt`, calls the `llm` CLI to refresh `dialogue.txt`, and then triggers audio and image generation.
- `ai_studio_code.py` streams multi-speaker audio via Google GenAI; helper functions such as `convert_to_wav` and `parse_audio_mime_type` live here.
- `generate_image.py` sends the final dialogue to Replicate’s `google/nano-banana` model and writes `my-image.png`.
- Generated artifacts (`ENTER_FILE_NAME_*.wav`, `dialogue.txt`, `my-image.png`) land in the repository root; keep working files under version control only when needed for review.

## Build, Test, and Development Commands
- `python3 -m venv .venv && source .venv/bin/activate` to isolate dependencies.
- `pip install google-genai replicate` installs the required Python packages.
- `./create.sh` runs the full workflow interactively; ensure `llm` is on PATH before launching.
- `python3 ai_studio_code.py` regenerates audio from the latest dialogue, while `python3 generate_image.py` refreshes the illustration.

## Coding Style & Naming Conventions
- Python code uses 4-space indentation, type-hinted return values, and descriptive function names (`save_binary_file`, `parse_audio_mime_type`); continue that pattern.
- Keep shell scripts POSIX-friendly with `set -euo pipefail`, uppercase environment variables, and snake_case filenames.
- Name generated media with the `ENTER_FILE_NAME_<index>.wav` pattern to preserve chronological order.

## Testing Guidelines
- No automated test suite exists yet; validate changes by running `./create.sh` end to end.
- Confirm that the regenerated WAV files play correctly and that `my-image.png` reflects the updated dialogue.
- When editing helper functions, add small harness snippets or logging to catch malformed MIME data before generating audio.

## Commit & Pull Request Guidelines
- Follow the Conventional Commits style seen in history (`feat:`, `refactor:`) and keep subjects under 72 characters.
- Reference linked issues in the description, include before/after media snippets when assets change, and list any manual verification steps.
- For pull requests, mention required environment variables and note whether regenerated artifacts are included or omitted.

## Security & Configuration Tips
- Export `GEMINI_API_KEY` for Google GenAI access, `REPLICATE_API_TOKEN` for image generation, and keep both outside version control.
- Avoid committing generated media with sensitive content; prefer attaching samples in PR descriptions when review is needed.
- Review `prompt2.txt` and `dialogue.txt` for accidental personal data before sharing externally.
