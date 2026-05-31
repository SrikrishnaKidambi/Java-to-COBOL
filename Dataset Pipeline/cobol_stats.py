import os
import sys
import csv
import re
from collections import defaultdict

if len(sys.argv) != 2:
    print("Usage: python cobol_stats.py <cobol_program_folder>")
    sys.exit(1)

FOLDER = sys.argv[1]

# -------------------------------
# 1. JAVA → COBOL MAPPED CONSTRUCTS
# -------------------------------
mapped_constructs = {
    "ACCEPT": r"\bACCEPT\b",
    "DISPLAY": r"\bDISPLAY\b",
    "ADD/COMPUTE": r"\bADD\b|\bCOMPUTE\b",
    "SUBTRACT/COMPUTE": r"\bSUBTRACT\b|\bCOMPUTE\b",
    "MOVE": r"\bMOVE\b",
    "COMMENTS": r"^\s*\*",                 
    "COMPUTE": r"\bCOMPUTE\b",
    "DIVIDE": r"\bDIVIDE\b",
    "EVALUATE": r"\bEVALUATE\b",
    "GO BACK": r"\bGO\s+BACK\b",
    "EXIT": r"\bEXIT\b",
    "STOP RUN": r"\bSTOP\s+RUN\b",
    "STRING": r"\bSTRING\b",
    "MULTIPLY": r"\bMULTIPLY\b",
    "UNSTRING": r"\bUNSTRING\b",
    "ORD/CHAR": r"FUNCTION\s+ORD|FUNCTION\s+CHAR",
    "IF-ELSE": r"\bIF\b|\bELSE\b",
    "PERFORM": r"\bPERFORM\b",
    "PERFORM USING": r"\bPERFORM\b.*\bUSING\b",
    "REMAINDER": r"\bGIVING\s+REMAINDER\b"
}

# -------------------------------
# 2. INTRINSIC FUNCTIONS
# -------------------------------
intrinsic_functions = [
    "ABS", "ACOS", "ASIN", "ATAN", "EXP", "FIRSTONE", "INTEGER", "LOG", "LOG10",
    "LOWER-CASE", "MAX", "MIN", "MOD", "NUMVAL", "RANDOM", "SIGN", "SIN", "SQRT",
    "ORD", "ORD-MAX", "ORD-MIN", "TAN", "UPPER-CASE"
]

intrinsic_patterns = {}
for fn in intrinsic_functions:
    fn_escaped = fn.replace("-", r"\-")
    intrinsic_patterns[fn] = r"FUNCTION\s+" + fn_escaped + r"\b"

# -------------------------------
# COUNTERS
# -------------------------------
construct_freq = defaultdict(int)
intrinsic_freq = defaultdict(int)
total_files = 0

# -------------------------------
# PROCESS FILES
# -------------------------------
for root, _, files in os.walk(FOLDER):
    for fname in files:
        if fname.lower().endswith((".cbl", ".cob", ".cobol")):
            total_files += 1
            path = os.path.join(root, fname)

            with open(path, "r", errors="ignore") as f:
                content = f.read().upper()

            # ---- mapped constructs ----
            for name, pattern in mapped_constructs.items():
                matches = re.findall(pattern, content, re.MULTILINE)
                construct_freq[name] += len(matches)

            # ---- intrinsic functions ----
            for name, pattern in intrinsic_patterns.items():
                matches = re.findall(pattern, content)
                intrinsic_freq[name] += len(matches)

# -------------------------------
# OUTPUT
# -------------------------------
print("\n==============================")
print(" COBOL DATASET STATISTICS")
print("==============================")
print("Total COBOL Programs:", total_files)

print("\n--- MAPPED CONSTRUCT FREQUENCY ---")
for k in sorted(construct_freq):
    print(f"{k:20s} : {construct_freq[k]}")

print("\n--- INTRINSIC FUNCTION FREQUENCY ---")
for k in sorted(intrinsic_freq):
    print(f"{k:15s} : {intrinsic_freq[k]}")

# -------------------------------
# SAVE CSV
# -------------------------------
with open("mapped_construct_stats.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["Construct", "Frequency"])
    for k in sorted(construct_freq):
        writer.writerow([k, construct_freq[k]])

with open("intrinsic_function_stats.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["Intrinsic Function", "Frequency"])
    for k in sorted(intrinsic_freq):
        writer.writerow([k, intrinsic_freq[k]])

print("\nCSV files generated:")
print(" - mapped_construct_stats.csv")
print(" - intrinsic_function_stats.csv")

