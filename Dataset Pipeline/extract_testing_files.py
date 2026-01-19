import os
import shutil

SOURCE_DIR = os.path.abspath(os.path.join("..", "CobolDataset60"))
DEST_DIR = os.path.abspath("./COBOL_files_1")

# Ensure destination directory exists
os.makedirs(DEST_DIR, exist_ok=True)

moved_count = 0

for file in os.listdir(SOURCE_DIR):
    if file.lower().endswith(".cbl"):
        src_path = os.path.join(SOURCE_DIR, file)
        dest_path = os.path.join(DEST_DIR, file)

        # Move the file
        shutil.move(src_path, dest_path)
        moved_count += 1

print(f"[SUCCESS] Moved {moved_count} .cbl files to {DEST_DIR}")
