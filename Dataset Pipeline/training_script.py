import torch
from datasets import load_dataset
from transformers import TrainingArguments, Trainer
from unsloth import FastLanguageModel

# ============================
# CONFIG
# ============================

MODEL_NAME = "unsloth/Qwen2.5-Coder-1.5B"
DATA_FILE  = "cobol_train.jsonl"
OUTPUT_DIR = "outputs/cobol-lora"

MAX_SEQ_LEN = 2048

# ============================
# LOAD DATASET
# ============================

print("Loading dataset...")
dataset = load_dataset("json", data_files=DATA_FILE)["train"]
dataset = dataset.train_test_split(test_size=0.1, seed=42)

train_ds = dataset["train"]
val_ds   = dataset["test"]

print("Train samples:", len(train_ds))
print("Val samples:", len(val_ds))

# ============================
# LOAD MODEL
# ============================

print("Loading model...")

model, tokenizer = FastLanguageModel.from_pretrained(
    model_name=MODEL_NAME,
    max_seq_length=MAX_SEQ_LEN,
    load_in_4bit=True,      # QLoRA
)

model = FastLanguageModel.get_peft_model(
    model,
    r=32,                                 # higher rank for better adaptation
    target_modules=["q_proj","k_proj","v_proj","o_proj"],
    lora_alpha=32,
    lora_dropout=0.05,
    bias="none",
    use_gradient_checkpointing=True,
)

# ============================
# TOKENIZATION
# ============================

def tokenize(batch):
    out = tokenizer(
        batch["text"],
        truncation=True,
        padding="max_length",
        max_length=MAX_SEQ_LEN,
    )
    out["labels"] = out["input_ids"].copy()
    return out

print("Tokenizing dataset...")

train_ds = train_ds.map(tokenize, batched=True, remove_columns=["text"])
val_ds   = val_ds.map(tokenize, batched=True, remove_columns=["text"])

# ============================
# TRAINING ARGS (A100 OPTIMIZED)
# ============================

args = TrainingArguments(
    output_dir=OUTPUT_DIR,

    per_device_train_batch_size=8,       # A100 can handle this
    per_device_eval_batch_size=8,
    gradient_accumulation_steps=2,        # effective batch = 16

    evaluation_strategy="steps",
    eval_steps=500,
    save_steps=500,
    logging_steps=50,

    num_train_epochs=3,
    learning_rate=2e-4,

    fp16=True,
    save_total_limit=2,
    load_best_model_at_end=True,
    metric_for_best_model="eval_loss",

    report_to="none",
)

# ============================
# TRAIN
# ============================

print("Starting training...")

trainer = Trainer(
    model=model,
    args=args,
    train_dataset=train_ds,
    eval_dataset=val_ds,
)

trainer.train()

# ============================
# SAVE FINAL MODEL
# ============================

print("Saving model...")
model.save_pretrained(OUTPUT_DIR)
tokenizer.save_pretrained(OUTPUT_DIR)

print("Training completed successfully!")
