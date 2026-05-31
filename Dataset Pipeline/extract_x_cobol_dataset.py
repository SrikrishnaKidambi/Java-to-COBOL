import os
import shutil

# Source and destination paths
SOURCE_DIR = r"E:\X-COBOL\X-COBOL\COBOL_Files"
DEST_DIR = "./X_COBOL_files"

# Create destination folder if it doesn't exist
os.makedirs(DEST_DIR, exist_ok=True)

# Walk through all subdirectories
for root, dirs, files in os.walk(SOURCE_DIR):
    for file in files:
        if file.lower().endswith(".cbl"):
            source_file = os.path.join(root, file)
            dest_file = os.path.join(DEST_DIR, file)

            # Handle duplicate filenames
            if os.path.exists(dest_file):
                base, ext = os.path.splitext(file)
                counter = 1
                while os.path.exists(dest_file):
                    dest_file = os.path.join(
                        DEST_DIR, f"{base}_{counter}{ext}"
                    )
                    counter += 1

            shutil.copy2(source_file, dest_file)
            print(f"Copied: {source_file}")
