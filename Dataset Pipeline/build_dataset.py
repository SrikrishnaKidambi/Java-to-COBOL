import os
import json
from transformers import AutoTokenizer

# -------- CONFIG --------
COBOL_DIR = "./cobol_files"   # <-- folder with .cbl / .cob
OUT_FILE = "cobol_lm_ready.jsonl"
MODEL_NAME = "Qwen/Qwen2.5-Coder-0.5B"

MAX_LEN = 512
STRIDE = 256

# ------------------------
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME, trust_remote_code=True)

all_text = []

for root, _, files in os.walk(COBOL_DIR):
    for fname in files:
        if fname.lower().endswith((".cbl", ".cob")):
            path = os.path.join(root, fname)
            try:
                with open(path, "r", errors="ignore") as f:
                    txt = f.read()
                    if len(txt.strip()) > 0:
                        all_text.append(txt)
            except Exception as e:
                print("Skip:", path, e)

print("Total COBOL files read:", len(all_text))

full_text = "\n\n".join(all_text)

tokens = tokenizer(full_text, return_tensors=None)["input_ids"]
print("Total tokens:", len(tokens))

samples = []
for i in range(0, len(tokens) - MAX_LEN, STRIDE):
    chunk = tokens[i : i + MAX_LEN]
    text = tokenizer.decode(chunk)
    samples.append({"text": text})

print("Total LM samples:", len(samples))

with open(OUT_FILE, "w") as f:
    for s in samples:
        f.write(json.dumps(s) + "\n")

print("Saved to:", OUT_FILE)

