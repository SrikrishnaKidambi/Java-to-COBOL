import os
import json
import random
from tqdm import tqdm
from transformers import AutoTokenizer

# ========== CONFIG ==========
COBOL_DIR = "./COBOL_Files"
OUT_FILE = "cobol_semantic_lm_v2.jsonl"

MODEL_NAME = "Qwen/Qwen2.5-Coder-0.5B"

MAX_LEN = 256
STRIDE = 12
MIN_TOKENS = 40

P_NORMAL = 0.4
P_PREFIX = 0.3
P_FIM = 0.3
# ============================

print("Loading tokenizer...")
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME, trust_remote_code=True)

FIM_PREFIX = "<|fim_prefix|>"
FIM_MIDDLE = "<|fim_middle|>"
FIM_SUFFIX = "<|fim_suffix|>"

def read_cobol_files(root):
    files = []
    for path, _, fnames in os.walk(root):
        for f in fnames:
            if f.lower().endswith((".cbl", ".cob")):
                files.append(os.path.join(path, f))
    return files

files = read_cobol_files(COBOL_DIR)
print("Total COBOL files:", len(files))

total_samples = 0

with open(OUT_FILE, "w", encoding="utf-8") as fout:
    for file in tqdm(files, desc="Processing COBOL files"):
        try:
            with open(file, "r", encoding="utf-8", errors="ignore") as f:
                text = f.read()
        except:
            continue

        tokens = tokenizer.encode(text, add_special_tokens=False)

        if len(tokens) < MIN_TOKENS:
            continue

        for start in range(0, len(tokens) - MIN_TOKENS, STRIDE):
            chunk = tokens[start : start + MAX_LEN]

            if len(chunk) < MIN_TOKENS:
                continue

            mode = random.random()

            # ===== MODE 1: FULL LM =====
            if mode < P_NORMAL:
                final_tokens = chunk

            # ===== MODE 2: PREFIX COMPLETION =====
            elif mode < P_NORMAL + P_PREFIX:
                if len(chunk) > MIN_TOKENS + 10:
                    cut = random.randint(MIN_TOKENS, len(chunk) - 5)
                    final_tokens = chunk[:cut] + chunk[cut:]
                else:
                    final_tokens = chunk

            # ===== MODE 3: FIM =====
            else:
                if len(chunk) > 80:
                    a = random.randint(10, len(chunk) - 60)
                    b = random.randint(a + 10, len(chunk) - 10)

                    prefix = chunk[:a]
                    middle = chunk[a:b]
                    suffix = chunk[b:]

                    fim_text = (
                        FIM_PREFIX + tokenizer.decode(prefix) +
                        FIM_SUFFIX + tokenizer.decode(suffix) +
                        FIM_MIDDLE + tokenizer.decode(middle)
                    )

                    final_tokens = tokenizer.encode(fim_text, add_special_tokens=False)
                else:
                    final_tokens = chunk

            final_tokens = final_tokens[:MAX_LEN]

            if len(final_tokens) < MIN_TOKENS:
                continue

            fout.write(json.dumps({"text": tokenizer.decode(final_tokens)}, ensure_ascii=False) + "\n")
            total_samples += 1

print("\n====================================")
print("Saved to:", OUT_FILE)
print("Total training samples:", total_samples)
print("====================================")

